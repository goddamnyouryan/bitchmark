class Bitchmark.Models.Account extends Backbone.AssociatedModel

  initialize: (options) ->
    @hashId = options.hashId

  urlRoot: ->
    "http://localhost:3000/api/accounts/#{@hashId}"

  relations: [
    type: Backbone.Many
    key: 'groups'
    relatedModel: 'Bitchmark.Models.Group'
  ]
