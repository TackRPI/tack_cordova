UpdateDispatchModel = require './model'
UpdateDispatchCollection = require './collection'

# # # # #

# UpdateDispatch service definition
# Manages fetching JSON from the server, syncing contacts
# and destroying UpdateDispatches after sync
class UpdateDispatchService extends require '../base/service'
  radioChannel:         'update_dispatch'
  modelPrototype:       UpdateDispatchModel
  collectionPrototype:  UpdateDispatchCollection

  radioRequests: =>
    requests = super
    requests['update_dispatch sync'] = 'syncUpdates'
    return requests

  # Syncs all UpdateDisaptches into native contacts manager
  syncUpdates: =>
    @collection()
    .then (updates) =>
      Promise.each(updates.models, (update) =>
        return update.syncToContacts()
      ).then () =>
        message = 'Synced ' + updates.length + ' contacts.'
        Backbone.Radio.channel('flash').trigger('success', { message: message })
        @destroyUpdates()

  # Destroys all UpdateDisaptches after syncUpdates
  destroyUpdates: =>
    @collection()
    .then (updates) =>
      Promise.each(updates.models, (update) =>
        return update.destroyPromise()
      )

# # # # #

module.exports = new UpdateDispatchService()
