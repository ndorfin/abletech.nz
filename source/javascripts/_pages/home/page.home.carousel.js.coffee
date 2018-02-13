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
    @homepageScroller = new IScroll('#slideshow_container', {
      scrollX: true,
      snap: 'li',
      eventPassthrough: true,
      momentum: false
    })

  hideShowNavButtons: () =>
    slideNumber = @homepageScroller.currentPage.pageX;
    slideLength = @homepageScroller.pages.length - 1;

    if slideNumber == 0
      @btnLeft.classList.add 'hidden'
      @btnRight.classList.remove 'hidden'
    else if slideNumber == slideLength
      @btnRight.classList.add 'hidden'
      @btnLeft.classList.remove 'hidden'
    else
      @btnLeft.classList.remove 'hidden'
      @btnRight.classList.remove 'hidden'

  bindEvents: =>
    @btnLeft = document.getElementById('carousel_btnleft')
    @btnRight = document.getElementById('carousel_btnright')

    @btnLeft.addEventListener 'click', (e) => @homepageScroller.prev()
    @btnRight.addEventListener 'click', (e) => @homepageScroller.next()

    @homepageScroller.on 'scrollEnd', (e) => @hideShowNavButtons()
    @hideShowNavButtons()

  handleHomepageCarouselResponse: (response) =>
    @hasHomepageScroller = true
    @carousel.innerHTML = response

    @addIScroll()

    setTimeout( () =>
      @homepageScroller.refresh()
    , 1500)

    @bindEvents()
    # export the homepageScroller object to the window,
    # so that the carousel step anchors can trigger the next slide.
    window.homepageScroller = @homepageScroller

  init: =>
    @getCarouselContent() if @carousel && !@hasHomepageScroller
