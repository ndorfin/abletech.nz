window.NotFound ||= {}

class NotFound.NotFoundPageHandler
  constructor: ->
    @currentPath = window.location.pathname

  bind: =>
    if @_redirectHandler().pathExists()
      @_redirectHandler().redirect()
    else
      @_callGoogle()

  _redirectHandler: =>
    @_handler ||= new NotFound.BlogRedirectHandler(path: @currentPath)

  _callGoogle: =>
    new NotFound.GoogleSearchHandler(currentPath: @currentPath).execute()

new NotFound.NotFoundPageHandler().bind()
