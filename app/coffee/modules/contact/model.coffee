
class ContactModel extends Backbone.Model

  # TODO - remove photos logic?
  defaults:
    photos: []

  parse: (resp) ->
    resp.photos ||= []
    resp.hasPhotos = if resp.photos[0] then true else false
    resp

  save: (params) =>

    onSuccess = (contact) =>
      console.log 'TODO - text shareProfile.toVCard() here'
      # Backbone.Radio.channel('sms').trigger('send:share_profile', @get('phone'))
      @trigger('sync', contact)

    onError = (contactError) =>
      @trigger('error', contactError)

    # # # # #
    # TODO - abstract this into the service
    # create a new native contact object
    contact = navigator.contacts.create()
    contact.displayName = params.displayName
    contact.nickname    = params.displayName

    # populate some fields
    # TODO - drop this?
    # name = new ContactName()
    # name.givenName = "Jane"
    # name.familyName = "Doe"
    # contact.name = name

    # Populate phone
    phoneNumbers = []
    phoneNumbers[0] = new ContactField('cell', params.phone, false)
    contact.phoneNumbers = phoneNumbers
    #
    # # # # #

    # save to device
    contact.save(onSuccess,onError)

# # # # #

module.exports = ContactModel
