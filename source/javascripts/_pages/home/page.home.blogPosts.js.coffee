window.Abletech ||= {}
class Abletech.BlogPosts
  'use strict'
  constructor: (elemID) ->
    @blogPosts = document.getElementById(elemID)

  blogPosts: null
  blogRSSFeed: 'http://abletech.ghost.io/tag/promoted/rss/'
  postsLoaded: false
  googleFeedAPI: '//ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=5&callback=handlePostsData&q='

  handlePostsData: (data) =>
    posts = data.responseData.feed.entries

    @blogPosts.innerHTML = '\
    <h1 class="heading heading_subsection">Latest from the Abletech Blog</h1>\
    <p id="blog_rss"><a href="http://blog.abletech.nz/rss">Subscribe to the Abletech Blog</a></p>\
    <div class="tumblr_container">\
      <ul class="tumblr_posts"></ul>\
    </div>'

    ul = @blogPosts.querySelector('.tumblr_posts')
    for i in [0..2]
      li = document.createElement('li')
      li.innerHTML = '\
      <h2><a href="' + posts[i]['link'] + '">' + posts[i]['title'] + '</a></h2>\
      <p class="published-date">' + new Date(posts[i]['publishedDate'] + '000').format('j F, Y') + '</p>\
      <div class="post-body">' + posts[i]['contentSnippet'] + '</div>\
      <a href="' + posts[i]['link'] + '">Read more of ‘' + posts[i]['title'] + '’…</a>'
      ul.appendChild(li)

  getPromotedBlogPosts: ->
    url = document.location.protocol + @googleFeedAPI + encodeURIComponent(@blogRSSFeed)

    callbackName = 'jsonp_callback_' + Math.round(100000 * Math.random())
    @postsLoaded = true
    window.handlePostsData = @handlePostsData

    window[callbackName] = (data) ->
      delete window[callbackName]
      @blogPosts.removeChild script
      callback data

    script = document.createElement('script')
    script.src = url + (if url.indexOf('?') >= 0 then '&' else '?') + 'callback=' + callbackName
    script.async = 1
    @blogPosts.appendChild(script)

  init: =>
    @getPromotedBlogPosts() if @blogPosts && !@postsLoaded
