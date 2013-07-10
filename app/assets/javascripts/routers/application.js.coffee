class Bitchmark.Routers.Application extends Backbone.Router

  routes:
    ':hashId': 'account'

  account: (hashId) ->
    new Bitchmark.Views.Page el: 'body'
