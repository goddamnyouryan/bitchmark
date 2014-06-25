class Bitchmark.Models.Account extends Backbone.AssociatedModel

  initialize: (options) ->
    @hashId = options.hashId

  urlRoot: ->
    "http://www.bitchmark.me/api/accounts/#{@hashId}.json"

  relations: [
    type: Backbone.Many
    key: 'groups'
    relatedModel: 'Bitchmark.Models.Group'
  ]
