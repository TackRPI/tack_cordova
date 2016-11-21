
# ShareProfileModel definition
# Provides a RESTful interface for ShareProfile database records
class ShareProfileModel extends Backbone.Model
  urlRoot: '/share_profiles'
  idAttribute: '_id'

  defaults:
    contact_method_ids: []

  # Helper method for sending a ShareProfile via SMS
  toMessage: =>
    cached = @get('cached')

    message = "Hello from Tack!\n"

    for method in cached.methods
      message += method.label + ':'
      message += "\t"
      message += method.value
      message += "\n"

    return message

# # # # #

module.exports = ShareProfileModel
