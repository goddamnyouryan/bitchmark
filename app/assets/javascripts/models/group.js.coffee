class Bitchmark.Models.Group extends Backbone.AssociatedModel

  relations: [
    type: Backbone.Many
    key: 'pages'
    relatedModel: 'Bitchmark.Models.Page'
  ]
