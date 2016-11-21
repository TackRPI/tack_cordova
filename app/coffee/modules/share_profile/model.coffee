
# TODO - document
class ShareProfileModel extends Backbone.Model
  urlRoot: '/share_profiles'

  idAttribute: '_id' # TODO - create base model, add this

  defaults:
    contact_method_ids: []

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
