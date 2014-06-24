class Bitchmark.Views.Bookmarklet extends Backbone.View

  template: JST['bookmarklet']

  initialize: (options) ->
    @model = new Bitchmark.Models.Account hashId: options.hashId
    @model.fetch success: => @render()

  render: ->
    @$el.prepend @template(model: @model)

  events: ->
    'change select': 'showNewGroup'
    'submit form': 'submitPage'
    'click .close': 'removeBookmarklet'

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
    @$('#bitchmark-bookmarklet form').remove()
    @$('#bitchmark-bookmarklet').prepend("<h2>Added link to your Account. <a href='http://www.bitchmark.me/#{@model.get('hash_id')}'>View your account</a>.</h2>")

  removeBookmarklet: ->
    @$('#bitchmark-bookmarklet').remove()
