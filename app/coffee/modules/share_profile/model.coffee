
class ShareProfileModel extends Backbone.Model
  urlRoot: '/share_profiles'

  idAttribute: '_id' # TODO - create base model, add this

  parse: (resp) ->
    console.log 'PARSE'
    console.log resp
    return resp

# # # # #

module.exports = ShareProfileModel
