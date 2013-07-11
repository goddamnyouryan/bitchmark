class Bitchmark.Models.Group extends Backbone.AssociatedModel

  idAttribute: 'hashId'

  urlRoot: ->
    "/api/groups"

  relations: [
    type: Backbone.Many
    key: 'pages'
    relatedModel: 'Bitchmark.Models.Page'
  ]
