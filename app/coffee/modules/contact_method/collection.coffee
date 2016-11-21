
class ContactMethodCollection extends Backbone.Collection
  model: require './model'
  url: '/contact_methods/'

# # # # #

module.exports = ContactMethodCollection
