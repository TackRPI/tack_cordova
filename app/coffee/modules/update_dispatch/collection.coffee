
# UpdateDispatchCollection class definition
# Defines a collection to store UpdateDispatchModel instances
class UpdateDispatchCollection extends Backbone.Collection
  model: require './model'
  url: '/update_dispatches/'

# # # # #

module.exports = UpdateDispatchCollection
