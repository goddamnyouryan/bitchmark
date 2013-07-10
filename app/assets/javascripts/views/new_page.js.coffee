class Bitchmark.Views.NewPage extends Backbone.View

  template: JST['new_page']

  initialize: (options) ->
    @model = options.model

  events: ->
    'change select': 'showNewGroup'
    'submit': 'submitPage'

  showNewGroup: (event) ->
    target = $(event.target)
    if target.val() == 'new'
      target.parents('p').after @template
    else
      @$el.find('.new_group').remove()

  submitPage: (event) ->
    event.preventDefault()
    target = $(event.target)
    @page = new Bitchmark.Models.Page @params()
    @page.save()
    @page.on 'sync', @success, @

  params: ->
    {
      page: {
        account_hash_id: @$el.find('#page_account_hash_id').val()
        url: @$el.find('#page_url').val()
        group: @$el.find('#page_group').val()
        new_group: @$el.find('#page_new_group').val()
      }
    }

  success: ->
    @$el.find('input[type=text], select').val ''
    @$el.find('#page_new_group').remove()
    Backbone.Mediator.publish('account:add')
