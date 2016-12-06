
# ShareProfileCollection class definition
# Defines a collection to store ShareProfileModel instances
class ShareProfileCollection extends Backbone.Collection
  model: require './model'
  url: '/share_profiles/'

# # # # #

module.exports = ShareProfileCollection
