class Bitchmark.Models.Account extends Backbone.AssociatedModel

  initialize: (options) ->
    @hashId = options.hashId

  urlRoot: ->
    "#{Bitchmark.Constants.API_ROOT}/api/accounts/#{@hashId}.json"

  relations: [
    type: Backbone.Many
    key: 'groups'
    relatedModel: 'Bitchmark.Models.Group'
  ]
