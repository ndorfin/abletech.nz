window.Abletech ||= {}
class Abletech.HighResStyles
  'use strict'

  constructor: (elemID) ->
    @stylesheetContainer = document.getElementById(elemID)

  stylesheetContainer: null

  addStyleSheet: =>
    text = @stylesheetContainer.value
    link = document.createElement('link')
    link.rel = 'stylesheet'
    link.href = text.match('/stylesheets/\\S+.css')
    (document.head || document.getElementsByTagName('head')[0]).appendChild(link)

  init: =>
    @addStyleSheet() if document.styleSheets.length <= 2 && @stylesheetContainer
