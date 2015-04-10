# requires window.shuffle and classList
window.Abletech ||= {}
class Abletech.HomepageLogos
  'use strict'

  constructor: (elemID) ->
    @logoContainer = document.getElementById(elemID)

  config:
    itemsPerColumn: 2
    maxColumns: 5
    hasLogosContainer: false

  logoContainer: null
  spareLogos: []
  animationControl: null

  logos: [
    {
      c:'logo_addressfinder'
      t:'AddressFinder'
    },{
      c:'logo_aed_locations'
      t:'AED Locations'
    },{
      c:'logo_auckland_transport'
      t:'Auckland Transport'
    },{
      c:'logo_c_w_j_p'
      t:'Cycling and Walking Journey Planner'
    },{
    #   c:'logo_kiwi_bank'
    #   t:'Kiwibank'
    # },{
      c:'logo_loyalty_nz'
      t:'Loyalty New Zealand'
    },{
      c:'logo_meat_mail'
      t:'Meatmail'
    },{
      c:'logo_met_service'
      t:'Met Service'
    },{
      c:'logo_msd'
      t:'Ministry of Social Development'
    },{
      c:'logo_nzx'
      t:'NZX'
    },{
    #   c:'logo_nz_post'
    #   t:'New Zealand Post'
    # },{
      c:'logo_radio_nz'
      t:'Radio New Zealand'
    },
    # {
    #   c:'logo_red_cross'
    #   t:'Red Cross'
    # },
    {
      c:'logo_reg_the_dog'
      t:'Reg the Dog'
    },{
      c:'logo_sharesight'
      t:'Sharesight'
    },{
      c:'logo_snapper'
      t:'Snapper'
    },
    # {
    #   c:'logo_spring_to_the_street'
    #   t:'Spring to the street'
    # },
    {
      c:'logo_watch_my_gear'
      t:'Watch my gear'
    }
  ]

  clearLogos: =>
    @logoContainer.innerHTML = ''
    @spareLogos = []

  addLogoToListItem: (logo, li) =>
    templateAnchor = document.createElement('a')
    templateAnchor.href = '#'
    templateAnchor.className = logo.c
    templateAnchor.innerHTML = logo.t
    li.appendChild(templateAnchor)

  replaceLogo: (logo, anchor) =>
    oldAnchor = {
      c: anchor.className
      t: anchor.innerHTML
    }
    anchor.className = logo.c
    anchor.innerHTML = logo.t
    @spareLogos.unshift(oldAnchor)

  addLogos: =>
    newArray = window.shuffle(@logos)
    templateUl = document.createElement('ul')
    templateUl.className = 'logo_blocks'

    counter = 0
    for i in [0..(@config.maxColumns-1)]
      templateLi = document.createElement('li')
      for j in [0..(@config.itemsPerColumn-1)]
        counter = (i * @config.itemsPerColumn) + j
        @addLogoToListItem(newArray[counter], templateLi)
      templateUl.appendChild(templateLi)
    @logoContainer.appendChild(templateUl)
    @addSpareLogos(counter+1)
    setTimeout( () =>
      @swopSpareLogo()
    , 1000)

  addSpareLogos: (startIndex) =>
    for i in [startIndex..(@logos.length-1)]
      @spareLogos.push(@logos[i])

  swopSpareLogo: =>
    anchors = document.querySelectorAll('#logos_container a')
    anchor = anchors[Math.floor(Math.random()*anchors.length)];
    spareLogo = @spareLogos[@spareLogos.length-1]
    @replaceLogo(spareLogo, anchor)
    @spareLogos.pop()

  loopThruLogos: =>
    @animationControl = window.setInterval( ()=>
      @swopSpareLogo()
    ,2000)

  stopLoop: =>
    window.clearInterval(@animationControl)

  unload: =>
    if @logoContainer && @config.hasLogosContainer
      @stopLoop()

  init: =>
    if @logoContainer && !@config.hasLogosContainer
      @config.hasLogosContainer = true
      @clearLogos()
      @addLogos()

    if @logoContainer && @config.hasLogosContainer
      @stopLoop()
      @loopThruLogos()
