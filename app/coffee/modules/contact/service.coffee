ContactModel = require './model'
ContactCollection = require './collection'

# # # # #

class ContactService extends Marionette.Service

  radioRequests:
    'contact model':      'model'
    'contact collection': 'collection'

  model: (id) ->
    return new Promise (resolve,reject) =>

      if @cached
        return resolve(@cached.get(id))
      else
        @collection().then () =>
          return resolve(@cached.get(id))

  collection: ->
    return new Promise (resolve,reject) =>

      # Return cached
      return resolve(@cached) if @cached

      # Instantiates @cached collection
      @cached = new ContactCollection()

      # Success callback
      onFindSuccess = (nativeContacts=[]) =>
        @cached.reset(nativeContacts, { parse: true })
        # window.contacts = contacts = new ContactCollection(nativeContacts, { parse: true })
        return resolve(@cached)

      # Error callback
      onFindError = () ->
        console.log 'ERROR FETCHING CONTACTS'
        return reject()

      navigator.contacts.find(['displayName'], onFindSuccess, onFindError)

      return

# # # # #

module.exports = new ContactService()
