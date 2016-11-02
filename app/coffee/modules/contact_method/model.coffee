
class ContactMethodModel extends Backbone.Model
  urlRoot: '/contact_methods'

  idAttribute: '_id'

  parse: (resp) ->
    resp.type = 'email'   if !!resp.email
    resp.type = 'phone'   if !!resp.phone
    resp.type = 'address' if !!resp.streetAddress
    return resp

# # # # #

module.exports = ContactMethodModel
