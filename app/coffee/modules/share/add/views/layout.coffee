ShareProfilePicker = require '../../../contact/new/views/shareProfilePicker'

# # # # #

# AddViaUsernameView class definition
# Defines a Marionette.LayoutView class to manage adding new
# users via Tack username. Includes interface to select a ShareProfile model instance
# to be shared with the new contact
class AddViaUsernameView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    ModelEvents: {}
    SubmitButton: {}

    Flashes:
      success:
        message:  'ShareProfile shared.'
      error:
        message:  'Error sharing ShareProfile.'

  # # # # #
  # TODO - this is identical to the contact/new view
  regions:
    shareProfileRegion: '[data-region=share-profiles]'

  ui:
    shareProfileId: '[name=share_profile_id]'

  onRender: ->
    @showShareProfilePicker()

  # TODO - validate phone.length & displayName.presence

  showShareProfilePicker: ->
    shareProfilePicker = new ShareProfilePicker({ collection: @collection })
    shareProfilePicker.on 'childview:selected', (view, selected) => @ui.shareProfileId.val(view.model.id)
    shareProfilePicker.on 'childview:deselected', (view, selected) => @ui.shareProfileId.val('')
    @shareProfileRegion.show shareProfilePicker
  #
  # # # # #

  onSubmit: (e) ->
    attrs = Backbone.Syphon.serialize(@)
    attrs.username = attrs.username.toLowerCase() # TODO - more elegant solution to this?
    @model.save(attrs)

  onRequest: ->
    @disableSubmit()

  onError: ->
    @flashError()
    @enableSubmit()

  onSync: ->
    @flashSuccess()
    Backbone.Radio.channel('app').trigger('redirect','#')

# # # # #

module.exports = AddViaUsernameView
