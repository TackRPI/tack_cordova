
class ShareProfileChild extends Marionette.LayoutView
  template: require './templates/share_profile_child'
  className: 'list-group-item'
  tagName: 'li'

  events:
    'click': 'onClick'

  onClick: (e) ->
    @trigger('selected')
    @$el.addClass('active').siblings().removeClass('active')

# # # # #

class ShareProfileList extends Marionette.CollectionView
  childView: ShareProfileChild
  className: 'list-group'
  tagName: 'ul'

# # # # #

class ContactAddView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    ModelEvents: {}
    SubmitButton: {}

    Flashes:
      success:
        message:  'Contact created.'
      error:
        message:  'Error creating Contact.'

  regions:
    shareProfileRegion: '[data-region=share-profiles]'

  onRender: ->
    @showShareProfilePicker()

  showShareProfilePicker: ->
    shareProfilePicker = new ShareProfileList({ collection: @collection })

    # TODO - clean this up
    shareProfilePicker.on 'childview:selected', (view, selected) =>
      @$('[name=share_profile_id]').val(view.model.id)

    @shareProfileRegion.show shareProfilePicker

  onRequest: ->
    @disableSubmit() # TODO - disable inputs as well?

  onError: ->
    @flashError()
    @enableSubmit()

  onSync: ->
    @flashSuccess()
    window.location = '#contacts' # TODO - redirection, state service?

  onSubmit: (e) ->
    attrs = Backbone.Syphon.serialize(@)
    @model.save(attrs)

# # # # #

module.exports = ContactAddView
