ContactMethodModel = require './model'
ContactMethodCollection = require './collection'

# # # # #

# ContactMethodService class definition
class ContactMethodService extends require '../base/service'

  radioChannel:         'contact_method'
  modelPrototype:       ContactMethodModel
  collectionPrototype:  ContactMethodCollection

# # # # #

module.exports = new ContactMethodService()
