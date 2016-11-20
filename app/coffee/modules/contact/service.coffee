ContactModel = require './model'
ContactCollection = require './collection'

# # # # #

class ContactService extends require '../base/service'

  radioChannel:         'contact'
  modelPrototype:       ContactModel
  collectionPrototype:  ContactCollection

# # # # #

module.exports = new ContactService()
