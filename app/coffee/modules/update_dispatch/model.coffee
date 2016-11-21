
# UpdateDispatch model definition
# Manages creation of syncing to native contacts
class UpdateDispatchModel extends Backbone.Model
  urlRoot: '/update_dispatches'

  syncToContacts: ->
    return new Promise (resolve, reject) =>

      # Create new Native Contact
      contact = navigator.contacts.create()

      # Set displayName & Nickname
      contact.displayName = @get('label')
      contact.nickname    = @get('label')

      # Caches, er, the cache
      cache = @get('cache')

      # Phone
      phoneNumbers = []
      for phone in cache.phone
        phoneNumbers.push new ContactField(phone.label, phone.phone, phone.pref)

      # Email
      emails = []
      for email in cache.email
        emails.push new ContactField(email.label, email.email, email.pref)

      # Address
      addresses = []
      for a in cache.address
        addresses.push new ContactAddress(a.pref, a.label, a.formatted, a.streetAddress, a.locality, a.region, a.postalCode, a.country)

      # Social
      socials = []
      for social in cache.social
        socials.push new ContactField(social.service, social.username, social.pref)

      # Assigns values to native contact
      contact.phoneNumbers  = phoneNumbers
      contact.emails        = emails
      contact.addresses     = addresses
      contact.ims           = socials

      # Saves
      onSuccess = (contact) =>
        Backbone.Radio.channel('flash').trigger('success', { message: 'Contact Synced.' })
        return resolve()

      onError = (contactError) =>
        Backbone.Radio.channel('flash').trigger('error', { message: 'Error Syncing Contact.' })
        return reject()

      contact.save(onSuccess,onError)
      return true

# # # # #

module.exports = UpdateDispatchModel
