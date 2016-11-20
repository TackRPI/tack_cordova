
# TODO - document
class BaseService extends Marionette.Service

  radioChannel:         null
  modelPrototype:       null
  collectionPrototype:  null

  radioRequests: =>
    "#{ @radioChannel } model":      'model'
    "#{ @radioChannel } collection": 'collection'

  initialize: ->
    @cached = new @collectionPrototype?()

  model: (id) ->
    return new Promise (resolve,reject) =>

      # Return new unless ID
      console.log 'getting model?'
      console.log @
      return resolve(new @modelPrototype()) unless id

      # Return from @cached
      if @cached._synced?
        return resolve(@cached.get(id))
      else
        @collection().then () =>
          return resolve(@cached.get(id))

  collection: ->
    return new Promise (resolve,reject) =>

      # Return cached
      return resolve(@cached) if @cached._synced?

      # Instantiates @cached collection
      @cached.on 'sync', =>
        @cached._synced = true # Flags collection as synced
        resolve(@cached) # Success callback

      # Fetches
      @cached.fetch()

      return

# # # # #

module.exports = BaseService
