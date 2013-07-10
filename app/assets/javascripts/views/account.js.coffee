class Bitchmark.Views.Account extends Backbone.View

  template: JST['account']

  subscriptions:
    'account:add': 'updateGroups'

  initialize: (options) ->
    @hashId = options.hashId
    @model = new Bitchmark.Models.Account hashId: @hashId
    @model.fetch success: @render

  render: =>
    new Bitchmark.Views.Group el: 'h2.group'
    new Bitchmark.Views.NewPage el: 'form#new_page', model: @model
    @displayGroups(@model)

  updateGroups: ->
    updatedModel = new Bitchmark.Models.Account hashId: @hashId
    @model.fetch
      success: (model) => @displayGroups(model)

  displayGroups: (model) ->
    @$el.find('ul#groups').html @template(account: model)
