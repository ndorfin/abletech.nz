# requires classList.js
window.Abletech ||= {}
class Abletech.UIManager
  'use strict'

  addGA: ->
    return @_addGA if @_addGA?
    @_addGA = new Abletech.Analytics()
    @_addGA.init()
    @_addGA

  blogPosts: ->
    return @_blogPosts if @_blogPosts?
    @_blogPosts = new Abletech.BlogPosts('blog_latest')
    @_blogPosts.init()
    @_blogPosts

  highResStyles: ->
    return @_highResStyles if @_highResStyles?
    @_highResStyles = new Abletech.HighResStyles()
    @_highResStyles.init()
    @_highResStyles

  homepageCarousel: ->
    return @_homepageCarousel if @_homepageCarousel?
    @_homepageCarousel = new Abletech.HomepageCarousel('carousel')
    @_homepageCarousel.init()
    @_homepageCarousel

  homepageLogos: ->
    return @_homepageLogos if @_homepageLogos?
    @_homepageLogos = new Abletech.HomepageLogos('logos_container')

  homepageQuote: ->
    return @_homepageQuote if @_homepageQuote?
    @_homepageQuote = new Abletech.Quote('quote')
    @_homepageQuote.init()
    @_homepageQuote

  homepageVideo: ->
    return @_homepageVideo if @_homepageVideo?
    @_homepageVideo = new Abletech.HomepageVideo('homepage_masthead')
    @_homepageVideo.init()
    @_homepageVideo

  menuLink: ->
    return @_menuLink if @_menuLink?
    @_menuLink = new Abletech.MenuLink('menu_link')
    @_menuLink.init()
    @_menuLink

  teamPolaroids: ->
    return @_polaroids if @_polaroids?
    @_polaroids = new Abletech.Polaroids('team_activities')
    @_polaroids.init()
    @_polaroids

  textReplacement: ->
    return @_textReplacement if @_textReplacement?
    @_textReplacement = new Abletech.TextReplacement()
    @_textReplacement.init()
    @_textReplacement

  workpageCarousel: ->
    return @_workpageCarousel if @_workpageCarousel?
    @_workpageCarousel = new Abletech.WorkpageCarousel()

  addResizeHandler: =>
    window.addEventListener 'resize', window.debounce( () =>
      if document.body.clientWidth < 600
        @homepageLogos().unload()

      if document.body.clientWidth >= 600
        @highResStyles()
        @homepageLogos().init()

      if document.body.clientWidth >= 1000
        @homepageCarousel()
        @blogPosts()

      if document.body.clientWidth >= 780
        @workpageCarousel().removeScroller() if @workpageCarousel().reachesScrollerAdded
      else
        @workpageCarousel().init()
    , 300)

  init: =>
    # Phase 1, general classes
    @menuLink()
    @textReplacement()

    # Phase 2, resolution-independent classes
    @homepageQuote()
    @homepageVideo()
    @teamPolaroids()
    @addGA()

    # Phase 3, resolution-specific classes
    if document.body.clientWidth < 800
      @workpageCarousel().init()

    if document.body.clientWidth >= 600
      @highResStyles()
      @homepageLogos().init()

    if document.body.clientWidth >= 1000
      @homepageCarousel()
      @blogPosts()

    # Phase 4, Watch the window.resize event
    @addResizeHandler()

abletechUI = new Abletech.UIManager()
abletechUI.init()
