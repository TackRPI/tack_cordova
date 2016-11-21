
# ShareProfileModel definition
# Provides a RESTful interface for ShareProfile database records
class ShareProfileModel extends Backbone.Model
  urlRoot: '/share_profiles'
  idAttribute: '_id'

  defaults:
    contact_method_ids: []

  # Helper method for sending a ShareProfile via SMS
  toMessage: =>

    message = "Hello from Tack!\n"

    cached = @get('cached')
    for name, methods of cached
      for each in methods
        message += each.label + ':'
        message += "\t"
        message += each.phone     if each.phone
        message += each.email     if each.email
        message += each.formatted if each.formatted
        message += each.username  if each.username
        message += "\n"

    return message

# # # # #

module.exports = ShareProfileModel
