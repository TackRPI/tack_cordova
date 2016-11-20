
ShareProfilePicker = require './shareProfilePicker'

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

  onRequest: ->
    @disableSubmit() # TODO - disable inputs as well?

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
    Backbone.Radio.channel('app').trigger('redirect', '#contacts')

  sendSms: =>
    # Gets ShareProfile by ID
    id = @model.get('share_profile_id')
    shareProfile = @collection.get(id)

    # Sends ShareProfile
    phone = @model.get('phone')
    message = shareProfile.toMessage()
    return Backbone.Radio.channel('sms').request('send', phone, message)

  onSubmit: (e) ->
    @disableSubmit()
    attrs = Backbone.Syphon.serialize(@)
    @model.save(attrs)

# # # # #

module.exports = ContactAddView
