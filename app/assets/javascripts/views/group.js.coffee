class Bitchmark.Views.Group extends Backbone.View

  events: ->
    'click .edit': 'showEditForm'

  showEditForm: (event) ->
    event.preventDefault()
    target = $(event.target)
