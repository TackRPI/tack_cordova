ShareProfileModel = require './model'
ShareProfileCollection = require './collection'

# # # # #

class ShareProfileService extends require '../base/service'
  radioChannel:         'share_profile'
  modelPrototype:       ShareProfileModel
  collectionPrototype:  ShareProfileCollection

# # # # #

module.exports = new ShareProfileService()
