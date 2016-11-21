
class ContactMethodDecorator extends require '../base/decorator'

  value: ->
    return @get('phone') if @get('phone')
    return @get('email') if @get('email')
    return @get('formatted') if @get('formatted')
    return @get('username') if @get('username') # TODO - social

  icon: ->
    return 'fa-phone'       if @get('phone')
    return 'fa-envelope-o'  if @get('email')
    return 'fa-home'        if @get('formatted')
    return 'fa-facebook'    if @get('username') # TODO - social

# # # # #

class ContactMethodModel extends Backbone.Model
  urlRoot: '/contact_methods'
  decorator: ContactMethodDecorator

  idAttribute: '_id'

  parse: (resp) ->
    resp.type = 'email'   if !!resp.email
    resp.type = 'phone'   if !!resp.phone
    resp.type = 'address' if !!resp.streetAddress
    resp.type = 'social'  if !!resp.username
    return resp

# # # # #

module.exports = ContactMethodModel
