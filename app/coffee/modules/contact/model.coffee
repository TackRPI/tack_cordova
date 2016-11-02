
class ContactModel extends Backbone.Model
  urlRoot: '/contacts'

  parse: (resp) ->
    console.log 'PARSE'
    console.log resp
    return resp

# # # # #

module.exports = ContactModel
