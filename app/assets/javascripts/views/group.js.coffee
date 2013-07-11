class Bitchmark.Views.Group extends Backbone.View

  initialize: ->
    @sortGroups()

  events: ->
    'click .edit': 'showEditForm'
    'click .link': 'showLinkField'
    'click .delete': 'confirmDelete'
    'click .yes': 'delete'
    'click .no': 'cancel'

  showEditForm: (event) ->
    event.preventDefault()
    target = $(event.target)
    header = target.parents('h2.group')
    header.find('.link-field, .confirm').remove()
    @removeOtherOptions(header)
    edit = header.find('.edit-title')
    if edit.length > 0
      @closeEditField(header)
    else
      target.addClass 'active'
      title = header.find('.title')
      field = "<input type='text' class='edit-title' value='#{title.html()}' />"
      title.html field

  showLinkField: (event) ->
    event.preventDefault()
    target = $(event.target)
    header = target.parents('h2.group')
    header.find('.confirm').remove()
    @removeOtherOptions(header)
    @closeEditField(header)
    linkField = header.find('.link-field')
    if linkField.length > 0
      linkField.remove()
    else
      hashId = target.parents('li').data('hash-id')
      host = window.location.href.split('/')[2]
      field = "<input type='text' class='link-field' value='http://#{host}/groups/#{hashId}' />"
      header.find('.icons').last().append field
      target.addClass 'active'

  confirmDelete: (event) ->
    event.preventDefault()
    target = $(event.target)
    header = target.parents('h2.group')
    @removeOtherOptions(header)
    header.find('.link-field').remove()
    @closeEditField(header)
    confirm = header.find('.confirm')
    if confirm.length > 0
      confirm.remove()
    else
      confirm = "<span class='confirm'>delete this group? <a href='#' class='yes'>yes</a> <a href='#' class='no'>no</a></span>"
      header.find('.icons').last().append confirm
      target.addClass 'active'

  delete: (event) ->
    event.preventDefault()
    target = $(event.target)
    li = target.parents('li')
    hashId = li.data('hash-id')
    li.remove()
    @group = new Bitchmark.Models.Group hashId: hashId
    @group.destroy()

  cancel: (event) ->
    event.preventDefault()
    target = $(event.target)
    @removeOtherOptions(target.parents('h2.group'))
    target.parents('.confirm').remove()

  closeEditField: (header) ->
    edit = header.find('.edit-title')
    if edit.length > 0
      hashId = header.parents('li').data('hash-id')
      @updateGroupTitle(hashId, edit.val())
      header.find('.title').html edit.val()

  removeOtherOptions: (header) ->
    header.find('.active').removeClass 'active'

  updateGroupTitle: (hashId, title) ->
    @group = new Bitchmark.Models.Group hashId: hashId
    @group.fetch
      success: (model) ->
        model.set title: title
        model.save()

  sortGroups: ->
    $('.sort').sortable
      axis: 'y'
      handle: '.drag'
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
