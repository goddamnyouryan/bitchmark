class Bitchmark.Views.NewPage extends Backbone.View

  template: JST['new_page']

  events: ->
    'change select': 'showNewGroup'

  showNewGroup: (event) ->
    target = $(event.target)
    if target.val() == 'new'
      target.parents('p').after @template
    else
      @$el.find('.new_group').remove()
