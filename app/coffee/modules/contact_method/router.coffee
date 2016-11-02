Service = require './service'
ListRoute = require './list/route'
NewRoute = require './new/route'
ShowRoute = require './show/route'

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

  edit: ->
    console.log 'EDIT CONTACT METHOD'

# # # # #

module.exports = new ContactMethodRouter()
