# requires classList.js
window.Abletech ||= {}
class Abletech.UIManager
  'use strict'

  addGA: ->
    return @_addGA if @_addGA?
    @_addGA = new UI.Analytics()
    @_addGA.init()
    @_addGA

  highResStyles: ->
    return @_highResStyles if @_highResStyles?
    @_highResStyles = new UI.HighResStyles()
    @_highResStyles.init()
    @_highResStyles

  menuLink: ->
    return @_menuLink if @_menuLink?
    @_menuLink = new UI.MenuLink('menu_link')
    @_menuLink.init()
    @_menuLink

  textReplacement: ->
    return @_textReplacement if @_textReplacement?
    @_textReplacement = new UI.TextReplacement()
    @_textReplacement.init()
    @_textReplacement

  addOffline: ->
    return @_addOL if @_addOL?
    @_addOL = new UI.Offline()

  addResizeHandler: =>
    window.addEventListener 'resize', window.debounce( () =>

      if document.body.clientWidth >= 600
        @highResStyles()

    , 300)

  init: =>
    # Phase 1, general classes
    @menuLink()
    @textReplacement()

    # Phase 2, resolution-independent classes
    @addGA()
    @addOffline()

    # Phase 3, resolution-specific classes
    if document.body.clientWidth >= 600
      @highResStyles()

    # Phase 4, Watch the window.resize event
    @addResizeHandler()

abletechUI = new Abletech.UIManager()
abletechUI.init()
