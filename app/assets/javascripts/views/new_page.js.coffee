class Bitchmark.Views.NewPage extends Backbone.View

  template: JST['new_page']

  initialize: (options) ->
    @model = options.model

  render: ->
    @$el.html @template(model: @model, csrf: @csrf())

  events: ->
    'change select': 'showNewGroup'
    'submit form': 'submitPage'

  csrf: ->
    $('meta[name=csrf-token]').attr 'content'

  showNewGroup: (event) ->
    target = $(event.target)
    if target.val() == 'new'
      @$el.find('.new_group').show()
    else
      @$el.find('.new_group').hide()

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
