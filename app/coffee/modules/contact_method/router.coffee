Service = require './service'
ListRoute = require './list/route'
ShowRoute = require './show/route'

# # # # #

class ContactMethodRouter extends Backbone.Routing.Router

  routes:
    'contact_methods(/)':          'list'
    'contact_methods/:id(/)':      'show'

  list: ->
    new ListRoute({ container: window.Container })

  show: (id) ->
    new ShowRoute({ container: window.Container, id: id })

# # # # #

module.exports = new ContactMethodRouter()
