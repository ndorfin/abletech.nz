window.Abletech ||= {}
class Abletech.HomepageCarousel
  'use strict'

  constructor: (elemID) ->
    @carousel = document.getElementById(elemID)

  hasHomepageScroller: false
  carousel: null
  homepageScroller: null

  getCarouselContent: =>
      request = new XMLHttpRequest()
      request.open('GET', '/homepage_carousel/', true)
      request.onreadystatechange = (e) =>
        if e.target.readyState == 4
          if e.target.status >= 200 && e.target.status < 400
            @handleHomepageCarouselResponse(e.target.responseText)
      request.send()
      request = null

  addIScroll: =>
    @homepageScroller = new IScroll('#slideshow_wrapper', {
      scrollX: true
      eventPassthrough: true
      snap: 'li'
    })

  bindCarouselScrollHint: =>
    @homepageScroller.on 'scrollEnd', () =>
      document.getElementById('carousel_nav').className = 'selected_' + Math.abs(@homepageScroller.x/1000)

  handleHomepageCarouselResponse: (response) =>
    @hasHomepageScroller = true
    @carousel.innerHTML = response

    @addIScroll()

    @bindCarouselScrollHint()

    setTimeout( () =>
      @homepageScroller.refresh()
    , 1000)

    # export the homepageScroller object to the window,
    # so that the carousel step anchors can trigger the next slide.
    window.homepageScroller = @homepageScroller

  init: =>
    @getCarouselContent() if @carousel && !@hasHomepageScroller
