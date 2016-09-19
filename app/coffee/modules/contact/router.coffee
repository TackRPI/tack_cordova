Service = require './service'
ListRoute = require './list/route'
ShowRoute = require './show/route'

# # # # #

class ContactRouter extends Backbone.Routing.Router

  routes:
    'contacts(/)':          'list'
    'contacts/:id(/)':      'show'

  list: ->
    new ListRoute({ container: window.Container })

  show: (id) ->
    new ShowRoute({ container: window.Container, id: id })

# # # # #

module.exports = new ContactRouter()
