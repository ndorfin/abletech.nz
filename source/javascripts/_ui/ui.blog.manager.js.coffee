# requires classList.js
window.Abletech ||= {}
class Abletech.BlogManager
  'use strict'

  addGA: ->
    return @_addGA if @_addGA?
    @_addGA = new UI.Analytics()
    @_addGA.init()
    @_addGA

  menuLink: ->
    return @_menuLink if @_menuLink?
    @_menuLink = new UI.MenuLink('menu_link')
    @_menuLink.init()
    @_menuLink

  init: =>

    # Phase 1, general classes
    @menuLink()

    # Phase 2, resolution-independent classes
    @addGA()

    # Phase 3, resolution-specific classes

    # Phase 4, Watch the window.resize event
    # @addResizeHandler()

abletechBlog = new Abletech.BlogManager()
abletechBlog.init()
