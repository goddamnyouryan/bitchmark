class Bitchmark.Views.Page extends Backbone.View

  template: JST['page']

  events: ->
    'change form select': 'showNewGroup'

  showNewGroup: (event) ->
    target = $(event.target)
    if target.val() == 'new'
      target.parents('p').after @template
    else
      @$el.find('.new_group').remove()
