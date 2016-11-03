ContactModel = require './model'
ContactCollection = require './collection'

# # # # #

class ContactService extends Marionette.Service

  radioRequests:
    'contact model':      'model'
    'contact collection': 'collection'

  model: (id) ->
    return new Promise (resolve,reject) =>

      # Return from @cached
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
      # TODO - error here if first fetch fails!
      @cached = new ContactCollection()
      @cached.on 'sync', => resolve(@cached) # Success callback
      @cached.fetch()

      return

# # # # #

module.exports = new ContactService()
