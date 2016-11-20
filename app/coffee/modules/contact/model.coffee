
# TODO - document
class ContactModel extends Backbone.Model

  # TODO - remove photos logic?
  defaults:
    photos: []

  # TODO - remove photos logic?
  parse: (resp) ->
    resp.photos ||= []
    resp.hasPhotos = if resp.photos[0] then true else false
    resp

  # Overwritten 'save' method to manage native contact
  # creation logic
  save: (params) =>

    # Sets the attributes locally
    # Mimics standard Backbone.js behavior
    @set(params)

    # Success & Error Callbacks
    onSuccess = (contact) => @trigger('sync', contact)
    onError = (contactError) => @trigger('error', contactError)

    # Request native Contact
    contact = Backbone.Radio.channel('contact').request('new', params)

    # Saves native contact locally on device
    contact.save(onSuccess,onError)

# # # # #

module.exports = ContactModel
