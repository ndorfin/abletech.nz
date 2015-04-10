# requires classList.js
window.Abletech ||= {}
class Abletech.WorkpageManager
  'use strict'

  workpageCarousel: ->
    return @_workpageCarousel if @_workpageCarousel?
    @_workpageCarousel = new Abletech.WorkpageCarousel()

  addResizeHandler: =>
    window.addEventListener 'resize', window.debounce( () =>

      if document.body.clientWidth >= 780
        @workpageCarousel().removeScroller() if @workpageCarousel().reachesScrollerAdded
      else
        @workpageCarousel().init()

    , 300)

  init: =>
    # Phase 1, general classes

    # Phase 2, resolution-independent classes

    # Phase 3, resolution-specific classes
    if document.body.clientWidth < 800
      @workpageCarousel().init()

    # Phase 4, Watch the window.resize event
    @addResizeHandler()

abletechWorkpage = new Abletech.WorkpageManager()
abletechWorkpage.init()
