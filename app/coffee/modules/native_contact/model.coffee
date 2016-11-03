
class ContactModel extends Backbone.Model
  defaults:
    photos: []

  parse: (resp) ->
    resp.photos ||= []
    resp.hasPhotos = if resp.photos[0] then true else false
    resp

# # # # #

module.exports = ContactModel
