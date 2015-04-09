window.Abletech ||= {}
class Abletech.HighResStyles
  'use strict'

  addStyleSheet: =>
    link = document.createElement('link')
    link.rel = 'stylesheet'
    link.id = 'high_res_stylesheet'
    link.href = window.highResCSSURL
    document.head.appendChild(link)

  init: =>
    @addStyleSheet() if !document.getElementById('high_res_stylesheet')
