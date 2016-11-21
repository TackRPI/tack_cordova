
# BaseService class definition
# The BaseService class provides interfaces to fetch
# models and collections from the server.
# It is essentially an abstract factory pattern
# that provides entities when subclassed with the appropriate
# radioChannel, modelPrototype, and collectionPrototype values
class BaseService extends Marionette.Service

  # These class attributes are overwritten
  # when subclassed
  radioChannel:         null
  modelPrototype:       null
  collectionPrototype:  null

  # Defines radioRequests
  radioRequests: =>
    "#{ @radioChannel } model":      'model'
    "#{ @radioChannel } collection": 'collection'

  # Caches a new instance of @collectionPrototype
  # Ensures we only maintain one set of database records locally
  initialize: ->
    @cached = new @collectionPrototype?()

  # Returns a new model, cached model,
  # or fetches model from server
  model: (id) ->
    return new Promise (resolve,reject) =>

      # Return new unless ID
      return resolve(new @modelPrototype()) unless id

      if @cached._synced?
        return resolve(@cached.get(id))
      else
        @collection().then () =>
          return resolve(@cached.get(id))

  # Returns cached collection if synced,
  # or fetches collection from server and returns
  collection: ->
    return new Promise (resolve, reject) =>

      # Return cached
      if @cached._synced?
        resolve(@cached)
        return @cached.fetch() # Background fetch on cached

      # Instantiates @cached collection
      @cached.on 'sync', =>
        @cached._synced = true # Flags collection as synced
        resolve(@cached) # Success callback

      # Fetches
      return @cached.fetch()

# # # # #

module.exports = BaseService
