ShareProfilePicker = require './shareProfilePicker'

# # # # #

# ContactAddView class definition
# The ContactAddView class manages user input collected
# with the goal of adding a new contact and sending a ShareProfile
# to them via SMS service.
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

  ui:
    shareProfileId: '[name=share_profile_id]'

  onRender: ->
    @showShareProfilePicker()

  # The view makes use of an abstracted ShareProfilePicker class
  # that handles selection of a ShareProfile to be serialized with the form's data.
  showShareProfilePicker: ->
    shareProfilePicker = new ShareProfilePicker({ collection: @collection })
    shareProfilePicker.on 'childview:selected', (view, selected) => @ui.shareProfileId.val(view.model.id)
    shareProfilePicker.on 'childview:deselected', (view, selected) => @ui.shareProfileId.val('')
    @shareProfileRegion.show shareProfilePicker

  onRequest: ->
    @disableSubmit()

  onError: ->
    @flashError()
    @enableSubmit()

  onSync: ->
    @flashSuccess()

    # Redirects unless ShareProfile was selected
    return @redirect() unless @model.get('share_profile_id')

    # Sends ShareProfile SMS
    @sendSms().then (args) =>
      @flashSuccess({ message: 'ShareProfile sent via SMS.'})
      @redirect()

  redirect: ->
    Backbone.Radio.channel('app').trigger('redirect', '#')

  sendSms: =>
    # Gets ShareProfile by ID
    id = @model.get('share_profile_id')
    shareProfile = @collection.get(id)

    # Sends ShareProfile
    phone = @model.get('phone')
    message = shareProfile.toMessage()
    return Backbone.Radio.channel('sms').request('send', phone, message)

  # TODO - validate phone.length & displayName.presence
  onSubmit: (e) ->
    @disableSubmit()
    @model.save(Backbone.Syphon.serialize(@))

# # # # #

module.exports = ContactAddView
