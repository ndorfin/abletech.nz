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
    slides = document.getElementById('slideshow_container')
    @homepageScroller = new IScroll(slides, {
      scrollX: true,
      snap: 'li',
      eventPassthrough: true,
      momentum: false
    })

  bindClickEvents: =>
    document.getElementById('carousel_btnleft').addEventListener 'click', (e) =>
      @homepageScroller.prev()

    document.getElementById('carousel_btnright').addEventListener 'click', (e) =>
      @homepageScroller.next()


  handleHomepageCarouselResponse: (response) =>
    @hasHomepageScroller = true
    @carousel.innerHTML = response

    @addIScroll()

    @bindClickEvents()

    setTimeout( () =>
      @homepageScroller.refresh()
    , 1000)


    # export the homepageScroller object to the window,
    # so that the carousel step anchors can trigger the next slide.
    window.homepageScroller = @homepageScroller

  init: =>
    @getCarouselContent() if @carousel && !@hasHomepageScroller
