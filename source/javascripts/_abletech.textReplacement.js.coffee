window.Abletech ||= {}
class Abletech.TextReplacement
  'use strict'

  getTimeText: ->
    timeText = 'Good morning.'
    dateNow = new Date(Date.now())
    if dateNow.getHours() > 11
      if dateNow.getHours() <= 18
        timeText = 'Good afternoon.'
      else
        timeText = 'Good evening.'
    timeText

  replacePlus: ->
    plusses = document.querySelector('.replace_plus')
    plusses.innerHTML = '+' if plusses

  replaceGreeting: =>
    greetings = document.querySelector('.replace_greeting')
    greetings.innerHTML = @getTimeText() if greetings

  addAnimation: ->
    for elem in document.querySelectorAll('.replace')
      elem.classList.add('replacing')

  removeAnimation: =>
    for elem in document.querySelectorAll('.replace')
      elem.classList.remove('replacing')
      elem.classList.add('replace_done')

  init: =>
    @addAnimation()
    window.setTimeout( ()=>
      @replacePlus()
      @replaceGreeting()
      window.setTimeout( ()=>
        @removeAnimation()
      , 300)
    , 300)
