window.Abletech ||= {}
class Abletech.BlogPosts
  'use strict'
  constructor: (elemID) ->
    @blogPosts = document.getElementById(elemID)

  blogPosts: null
  postsLoaded: false

  handlePostsData: (data) =>
    console.log("callback")
    console.log(data)
    posts = data.items || []
    @blogPosts.innerHTML = ''

    if posts && posts.length > 0

      @blogPosts.innerHTML = '\
      <h1 class="heading heading_subsection">Latest from the Abletech Blog</h1>\
      <p id="blog_rss"><a href="https://stories.abletech.nz/feed">Subscribe to the Abletech Blog</a></p>\
      <div class="blog_container">\
        <ul class="blog_posts"></ul>\
      </div>'

      ul = @blogPosts.querySelector('.blog_posts')
      for i in [0..(Math.min(2, (posts.length - 1)))]
        regex = new RegExp('(<p[ >].*?</p>)')
        firstP = regex.exec(posts[i]['description'])[0]
        li = document.createElement('li')
        li.innerHTML = '\
        <h2><a href="' + posts[i]['post_url'] + '">' + posts[i]['title'] + '</a></h2>\
        <p class="published-date">' + new Date(posts[i]['pubDate']).format('j F, Y') + '</p>\
        <div class="post-body">' + firstP + '</div>\
        <a href="' + posts[i]['link'] + '">Read more of ‘' + posts[i]['title'] + '’…</a>'
        ul.appendChild(li)

  getPosts: =>
    @postsLoaded = true
    window.handlePostsData = @handlePostsData

    xhrURL = 'https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fstories.abletech.nz%2Ffeed%2Ftagged%2Ffeatured&api_key=eyqr8biv6z4ol88dbc87hclmuvrw2mm4mzqaduh0'
    xhrURL += '&callback=handlePostsData'

    script = document.createElement('script')
    script.async = 1
    script.src = xhrURL
    @blogPosts.appendChild(script)

  init: =>
    @getPosts() if @blogPosts && !@postsLoaded
