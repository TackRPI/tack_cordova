Service = require './service'
ListRoute = require './list/route'
NewRoute = require './new/route'
ShowRoute = require './show/route'
EditRoute = require './edit/route'

# # # # #

class ContactMethodRouter extends Backbone.Routing.Router

  routes:
    'contact_methods(/)':           'list'
    'contact_methods/new(/)':       'new'
    'contact_methods/:id(/)':       'show'
    'contact_methods/:id/edit(/)':  'edit'

  list: ->
    new ListRoute({ container: window.Container })

  new: ->
    new NewRoute({ container: window.Container })

  show: (id) ->
    new ShowRoute({ container: window.Container, id: id })

  edit: (id) ->
    new EditRoute({ container: window.Container, id: id })

# # # # #

module.exports = new ContactMethodRouter()
