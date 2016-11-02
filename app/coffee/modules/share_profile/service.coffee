ShareProfileModel = require './model'
ShareProfileCollection = require './collection'

# # # # #

class ShareProfileService extends Marionette.Service

  radioRequests:
    'share_profile model':      'model'
    'share_profile collection': 'collection'

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
      @cached = new ShareProfileCollection()
      @cached.on 'sync', => resolve(@cached) # Success callback
      @cached.fetch()

      return

# # # # #

module.exports = new ShareProfileService()
