
class ShareProfileModel extends Backbone.Model
  urlRoot: '/share_profiles'

  idAttribute: '_id' # TODO - create base model, add this

  defaults:
    contact_method_ids: []

  # TODO - add 'displayName' into cached, must be done on server
  toMessage: =>
    cached = @get('cached')

    # TODO - change message?
    message = "Hello from Tack!\n"

    # TODO - displayName
    for method in cached.methods
      message += method.label + ':'
      message += "\t"
      message += method.value
      message += "\n"

    return message

# # # # #

module.exports = ShareProfileModel
