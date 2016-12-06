ShareProfileModel = require './model'
ShareProfileCollection = require './collection'

# # # # #

# ShareProfileService class definition
class ShareProfileService extends require '../base/service'
  radioChannel:         'share_profile'
  modelPrototype:       ShareProfileModel
  collectionPrototype:  ShareProfileCollection

# # # # #

module.exports = new ShareProfileService()
