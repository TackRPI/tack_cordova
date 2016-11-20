
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

    console.log @model.attributes

    if @model.get('share_profile_id')
      @sendSms().then (args) =>
        @flashSuccess({ message: 'ShareProfile sent via SMS.'})
        window.location = '#contacts' # TODO - redirection, state service?
    else
      window.location = '#contacts' # TODO - redirection, state service?

  sendSms: =>
    # Gets ShareProfile
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
