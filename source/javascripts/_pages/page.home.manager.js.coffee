# requires classList.js
window.Abletech ||= {}
class Abletech.HomepageManager
  'use strict'

  blogPosts: ->
    return @_blogPosts if @_blogPosts?
    @_blogPosts = new Abletech.BlogPosts('blog_latest')
    @_blogPosts.init()
    @_blogPosts

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

  addResizeHandler: =>
    window.addEventListener 'resize', window.debounce( () =>

      if document.body.clientWidth < 600
        @homepageLogos().unload()

      if document.body.clientWidth >= 600
        @homepageLogos().init()

      if document.body.clientWidth >= 1000
        @homepageCarousel()
        @blogPosts()

    , 300)

  init: =>
    # Phase 1, general classes

    # Phase 2, resolution-independent classes
    @homepageQuote()

    # Phase 3, resolution-specific classes
    if document.body.clientWidth >= 600
      @homepageLogos().init()

    if document.body.clientWidth >= 1000
      @homepageCarousel()
      @blogPosts()

    # Phase 4, Watch the window.resize event
    @addResizeHandler()

bootstrap = ->
	if window.Abletech.LOADED
		abletechHomepage = new Abletech.HomepageManager()
		abletechHomepage.init()
	else
		window.setTimeout(bootstrap, 10)

bootstrap()
