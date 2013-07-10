class Bitchmark.Routers.Application extends Backbone.Router

  routes:
    ':hashId': 'account'
    'groups/:hashId': 'group'

  account: (hashId) ->
    new Bitchmark.Views.Account el: 'body', hashId: hashId

  group: (hashId) ->
    new Bitchmark.Views.Group el: 'h2.group'
