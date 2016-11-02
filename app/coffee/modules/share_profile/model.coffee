
class ShareProfileModel extends Backbone.Model
  urlRoot: '/share_profiles'

  idAttribute: '_id' # TODO - create base model, add this

  defaults:
    contact_method_ids: []

  parse: (resp) ->
    console.log 'PARSE'
    console.log resp
    return resp

# # # # #

module.exports = ShareProfileModel
