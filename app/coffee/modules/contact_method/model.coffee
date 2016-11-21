
# ContactMethodDecorator class definition
# Defines helper functions used when a ContactMethodModel
# is serialized into a view's template
class ContactMethodDecorator extends require '../base/decorator'

  value: ->
    return @get('phone')      if @get('phone')
    return @get('email')      if @get('email')
    return @get('formatted')  if @get('formatted')
    return @get('username')   if @get('username')

  icon: ->
    return 'fa-phone'       if @get('phone')
    return 'fa-envelope-o'  if @get('email')
    return 'fa-home'        if @get('formatted')
    return 'fa-comments-o'  if @get('username')

# # # # #

# ContactMethodModel class definition
# RESTful interface for ContactMethod database records
class ContactMethodModel extends Backbone.Model
  urlRoot: '/contact_methods'
  idAttribute: '_id'
  decorator: ContactMethodDecorator

  # Adds a 'type' helper attribute
  parse: (resp) ->
    resp.type = 'email'   if !!resp.email
    resp.type = 'phone'   if !!resp.phone
    resp.type = 'address' if !!resp.streetAddress
    resp.type = 'social'  if !!resp.username
    return resp

# # # # #

module.exports = ContactMethodModel
