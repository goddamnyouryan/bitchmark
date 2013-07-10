class Bitchmark.Models.Account extends Backbone.AssociatedModel

  initialize: (options) ->
    @hashId = options.hashId

  urlRoot: ->
    "/api/accounts/#{@hashId}"

  relations: [
    type: Backbone.Many
    key: 'groups'
    relatedModel: 'Bitchmark.Models.Group'
  ]
