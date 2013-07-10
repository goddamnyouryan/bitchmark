class Bitchmark.Views.Account extends Backbone.View

  template: JST['account']

  initialize: (options) ->
    @hashId = options.hashId
    @model = new Bitchmark.Models.Account hashId: @hashId
    @model.fetch success: @render

  render: =>
    new Bitchmark.Views.NewPage el: 'form#new_page'
    new Bitchmark.Views.Group el: 'h2.group'
    @$el.find('ul#groups').html @template(account: @model)
