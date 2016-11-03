
class ContactCollection extends Backbone.Collection
  model: require './model'
  url: '/update_dispatches'

# # # # #

module.exports = ContactCollection
