UpdateDispatchModel = require './model'
UpdateDispatchCollection = require './collection'

# # # # #

class UpdateDispatchService extends require '../base/service'

  radioChannel:         'update_dispatch'
  modelPrototype:       UpdateDispatchModel
  collectionPrototype:  UpdateDispatchCollection

# # # # #

module.exports = new UpdateDispatchService()
