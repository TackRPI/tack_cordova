ContactMethodModel = require './model'
ContactMethodCollection = require './collection'

# # # # #

# TODO - abstract this service into a super-class
class ContactMethodService extends Marionette.Service

  radioRequests:
    'contact_method model':      'model'
    'contact_method collection': 'collection'

  model: (id) ->
    return new Promise (resolve,reject) =>

      # Return new unless ID specified
      return resolve(new ContactMethodModel()) unless id

      # Return from Cached
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
      @cached = new ContactMethodCollection()
      @cached.on 'sync', => resolve(@cached) # Success callback
      @cached.fetch()

      return

# # # # #

module.exports = new ContactMethodService()
