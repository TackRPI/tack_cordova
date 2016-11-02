Service = require './service'
ListRoute = require './list/route'
AddRoute = require './add/route'
ShowRoute = require './show/route'

# # # # #

class ContactRouter extends Backbone.Routing.Router

  routes:
    'contacts(/)':          'list'
    'contacts/add(/)':      'add'
    'contacts/:id(/)':      'show'


  list: ->
    new ListRoute({ container: window.Container })

  add: ->
    new AddRoute({ container: window.Container })

  show: (id) ->
    new ShowRoute({ container: window.Container, id: id })

# # # # #

module.exports = new ContactRouter()
