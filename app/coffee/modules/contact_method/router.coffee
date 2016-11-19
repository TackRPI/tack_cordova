Service = require './service'
ListRoute = require './list/route'
NewRoute = require './new/route'
ShowRoute = require './show/route'
EditRoute = require './edit/route'

# # # # #

class ContactMethodRouter extends require '../base/router'

  routes:
    'contact_methods(/)':           'list'
    'contact_methods/new(/)':       'new'
    'contact_methods/:id(/)':       'show'
    'contact_methods/:id/edit(/)':  'edit'

  list: ->
    new ListRoute({ container: @container })

  new: ->
    new NewRoute({ container: @container })

  show: (id) ->
    new ShowRoute({ container: @container, id: id })

  edit: (id) ->
    new EditRoute({ container: @container, id: id })

# # # # #

module.exports = new ContactMethodRouter({ container: window.Layout.mainRegion })
