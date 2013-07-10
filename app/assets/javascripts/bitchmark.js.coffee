window.Bitchmark =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Bitchmark.Routers.Application
    Backbone.history.start pushState: true

$(document).ready ->
  Bitchmark.initialize()
