window.Abletech ||= {}
class Abletech.BlogPosts
  'use strict'
  constructor: (elemID) ->
    @blogPosts = document.getElementById(elemID)

  blogPosts: null
  postsLoaded: false

  handlePostsData: (data) =>
    posts = data.response.posts

    @blogPosts.innerHTML = '\
    <h1 class="heading heading_subsection">Latest from the Abletech Blog</h1>\
    <p id="blog_rss"><a href="http://blog.abletech.nz/rss">Subscribe to the Abletech Blog</a></p>\
    <div class="tumblr_container">\
      <ul class="tumblr_posts"></ul>\
    </div>'

    ul = @blogPosts.querySelector('.tumblr_posts')
    for i in [0..2]
      regex = new RegExp('(<p[ >].*?</p>)')
      firstP = regex.exec(posts[i]['body'])[0]
      li = document.createElement('li')
      li.innerHTML = '\
      <h2><a href="' + posts[i]['post_url'] + '">' + posts[i]['title'] + '</a></h2>\
      <p class="published-date">' + new Date(parseInt(posts[i]['timestamp'] + '000')).format('j F, Y') + '</p>\
      <div class="post-body">' + firstP + '</div>\
      <a href="' + posts[i]['post_url'] + '">Read more of ‘' + posts[i]['title'] + '’…</a>'
      ul.appendChild(li)

  getPostsFromTumblr: =>
    @postsLoaded = true
    window.handlePostsData = @handlePostsData

    baseURL = 'https://api.tumblr.com/v2/blog/blog.abletech.nz/posts'
    consumerKey = 'A3b8bQpBReiqQz2t6aHj3xcfjolU8dNxDkvVE2xv4c5KNzXx1F'
    filter = 'tag=promoted'
    callback = 'handlePostsData'
    xhrURL = baseURL + '?callback=' + callback + '&api_key=' + consumerKey + '&' + filter

    script = document.createElement('script')
    script.async = 1
    script.src = xhrURL
    @blogPosts.appendChild(script)

  init: =>
    @getPostsFromTumblr() if @blogPosts && !@postsLoaded
