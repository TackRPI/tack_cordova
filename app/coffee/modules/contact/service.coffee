ContactModel = require './model'
ContactCollection = require './collection'

# # # # #

class ContactService extends require '../base/service'
  radioChannel:         'contact'
  modelPrototype:       ContactModel
  collectionPrototype:  ContactCollection

  radioRequests: =>
    requests = super
    requests['contact new'] = 'newNative'
    return requests

  newNative: (params) ->

    # Create new Native Contact
    contact = navigator.contacts.create()
    contact.displayName = params.displayName
    contact.nickname    = params.displayName

    # Phone Numbers
    phoneNumbers = []
    phoneNumbers[0] = new ContactField('cell', params.phone, false)
    contact.phoneNumbers = phoneNumbers

    return contact

  collection: ->
    return new Promise (resolve,reject) =>

      # Return cached
      return resolve(@cached) if @cached._synced?

      # Success callback
      onFindSuccess = (nativeContacts=[]) =>
        @cached.reset(nativeContacts, { parse: true })
        @cached._synced = true
        # window.contacts = contacts = new ContactCollection(nativeContacts, { parse: true })
        return resolve(@cached)

      # Error callback
      onFindError = () ->
        return reject()

      # Native contacts fetch
      return navigator.contacts.find(['displayName'], onFindSuccess, onFindError)

# # # # #

module.exports = new ContactService()
