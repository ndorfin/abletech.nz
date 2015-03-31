# requires classList.js
window.Abletech ||= {}
class Abletech.UIManager
  'use strict'

  addGA: ->
    return @_addGA if @_addGA?
    @_addGA = new Abletech.Analytics()
    @_addGA.init()
    @_addGA

  menuLink: ->
    return @_menuLink if @_menuLink?
    @_menuLink = new Abletech.MenuLink('menu_link')
    @_menuLink.init()
    @_menuLink

  # addResizeHandler: =>
  #   window.addEventListener 'resize', window.debounce( () =>
  #     if document.body.clientWidth < 600
  #       @homepageLogos().unload()

  #     if document.body.clientWidth >= 600
  #       @highResStyles()
  #       @homepageLogos().init()

  #     if document.body.clientWidth >= 1000
  #       @homepageCarousel()
  #       @blogPosts()

  #     if document.body.clientWidth >= 780
  #       @workpageCarousel().removeScroller() if @workpageCarousel().reachesScrollerAdded
  #     else
  #       @workpageCarousel().init()
  #   , 300)

  init: =>
    # Phase 1, general classes
    @menuLink()

    # Phase 2, resolution-independent classes
    # @homepageQuote()
    # @homepageVideo()
    # @teamPolaroids()
    @addGA()

    # Phase 3, resolution-specific classes
    # if document.body.clientWidth < 800
    #   @workpageCarousel().init()

    # if document.body.clientWidth >= 600
    #   @highResStyles()
    #   @homepageLogos().init()

    # if document.body.clientWidth >= 1000
    #   @homepageCarousel()
    #   @blogPosts()

    # Phase 4, Watch the window.resize event
    # @addResizeHandler()

abletechUI = new Abletech.UIManager()
abletechUI.init()
