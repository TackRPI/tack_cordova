UpdateDispatchModel = require './model'
UpdateDispatchCollection = require './collection'

# # # # #

class UpdateDispatchService extends require '../base/service'

  radioChannel:         'update_dispatch'
  modelPrototype:       UpdateDispatchModel
  collectionPrototype:  UpdateDispatchCollection

  radioRequests: =>
    requests = super
    requests['update_dispatch sync'] = 'syncUpdates'
    return requests

  syncUpdates: =>
    @collection()
    .then (updates) =>
      Promise.each(updates.models, (update) =>
        return update.syncToContacts()
      )

  destroyUpdates: =>
    @collection()
    .then (updates) =>
      Promise.each(updates.models, (update) =>
        return update.destroy()
      )

# # # # #

module.exports = new UpdateDispatchService()
