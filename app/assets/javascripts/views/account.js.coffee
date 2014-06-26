class Bitchmark.Views.Account extends Backbone.View

  template: JST['account']

  subscriptions:
    'account:add': 'updateGroups'

  initialize: (options) ->
    @hashId = options.hashId
    @model = @newModel()
    @form = new Bitchmark.Views.NewPage(el: 'div#sidebar', model: @model)
    @model.fetch success: @render

  render: =>
    @groups = new Bitchmark.Views.Group el: 'ul#groups'
    @form.render()
    @displayGroups(@model)

  newModel: ->
    new Bitchmark.Models.Account hashId: @hashId

  updateGroups: ->
    updatedModel = @newModel()
    @model.fetch
      success: =>
        @groups.unbind()
        @groups.undelegateEvents()
        @render()

  displayGroups: (model) ->
    @$el.find('ul#groups').html @template(account: model)
