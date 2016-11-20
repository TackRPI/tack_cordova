
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
    console.log 'SEND SHARE PROFILE'
    console.log 'TO: ', attrs.phone

    shareProfile = @collection.get(attrs.share_profile_id)
    console.log shareProfile
    console.log shareProfile.toMessage()
    return Backbone.Radio.channel('sms').request('send', attrs.phone, shareProfile.toMessage())

  onSubmit: (e) ->
    @disableSubmit()
    attrs = Backbone.Syphon.serialize(@)
    @model.save(attrs)

# # # # #

module.exports = ContactAddView
