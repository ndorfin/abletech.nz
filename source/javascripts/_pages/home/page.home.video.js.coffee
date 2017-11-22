# window.Abletech ||= {}
# class Abletech.HomepageVideo
#   'use strict'
#
#   constructor: (elemID) ->
#     @homepageMasthead = document.getElementById(elemID)
#
#   homepageMasthead: null
#   hasHomepageVideo: false
#
#   addVideoInteraction: =>
#     if @homepageMasthead && !@hasHomepageVideo
#       document.getElementById('meet_carl_link').addEventListener('click', @meetCarlHandler)
#
#   meetCarlHandler: (e) =>
#     e.preventDefault()
#     @hasHomepageVideo = true
#     @addHomepageVideo()
#     @homepageMasthead.classList.add('video_active')
#
#   addHomepageVideo: =>
#     iframeWrapper = document.createElement('div')
#     iframeWrapper.className = 'iframe_container'
#     iframeWrapper.id = 'homepage_video'
#     iframeWrapper.setAttribute('role', 'dialog')
#     iframeWrapper.setAttribute('aria-labelledby', 'video_label')
#     iframeWrapper.innerHTML = '\
#       <h1 id="video_label">Carl, our Managing Director, talks about how we work at Abletech</h1>\
#       <iframe frameborder="0" src="//player.vimeo.com/video/37550769?title=0&amp;byline=0&amp;portrait=0&amp;color=990c1a&amp;autoplay=1"></iframe>\
#       <a id="iframe_close">Close video</a>'
#
#     @homepageMasthead.appendChild(iframeWrapper)
#     document.getElementById('homepage_video').focus()
#     window.scrollTo(0,0)
#     document.getElementById('iframe_close').addEventListener('click', @closeVideo)
#     document.body.addEventListener('keyup', @escapeVideo)
#
#   escapeVideo: (e) =>
#     if e.keyCode == 27
#       @closeVideo()
#
#   closeVideo: (e) =>
#     document.getElementById('iframe_close').removeEventListener('click', @closeVideo)
#     document.body.removeEventListener('keyup', @escapeVideo)
#     @homepageMasthead.classList.remove('video_active')
#     iframeContainer = document.querySelector('.iframe_container')
#     iframeContainer.parentNode.removeChild(iframeContainer)
#
#   init: =>
#     @addVideoInteraction()
