ContactModel = require './model'
ContactCollection = require './collection'

# # # # #

class ContactService extends require '../base/service'
  radioChannel:         'contact'
  modelPrototype:       ContactModel
  collectionPrototype:  ContactCollection

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
        console.log 'ERROR FETCHING CONTACTS'
        return reject()

      # Native contacts fetch
      return navigator.contacts.find(['displayName'], onFindSuccess, onFindError)

# # # # #

module.exports = new ContactService()
