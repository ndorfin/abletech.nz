window.Abletech ||= {}
class Abletech.WorkpageCarousel
  'use strict'

  reachesScrollerAdded: false
  reachesScroller: null

  removeScroller: =>
    @reachesScroller.destroy()
    @reachesScroller = null
    @reachesScrollerAdded = false

  addScroller: =>
    @reachesScrollerAdded = true
    @reachesScroller = new IScroll('#reaches_wrapper', {
      scrollX: true
      eventPassthrough: true
      mouseWheel: true
      snap: 'li'
    })
    setTimeout( () =>
      @reachesScroller.refresh()
    , 1000)

  init: =>
    @addScroller() if !@reachesScrollerAdded && document.getElementById('reaches_wrapper')
