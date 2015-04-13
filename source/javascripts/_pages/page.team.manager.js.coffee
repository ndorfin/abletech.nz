# requires classList.js
window.Abletech ||= {}
class Abletech.TeampageManager
  'use strict'

  teamPolaroids: ->
    return @_polaroids if @_polaroids?
    @_polaroids = new Abletech.Polaroids('team_activities')
    @_polaroids.init()
    @_polaroids

  init: =>
    # Phase 1, general classes

    # Phase 2, resolution-independent classes
    @teamPolaroids()

bootstrap = ->
	if window.Abletech.LOADED
		abletechTeampage = new Abletech.TeampageManager()
		abletechTeampage.init()
	else
		window.setTimeout(bootstrap, 10)

bootstrap()
