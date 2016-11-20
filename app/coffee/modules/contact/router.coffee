Service = require './service'
ListRoute = require './list/route'
ShowRoute = require './show/route'
NewRoute  = require './add_manual/route'

# # # # #

class ContactRouter extends Backbone.Routing.Router

  routes:
    'contacts(/)':      'list'
    'contacts/new(/)':  'new'
    'contacts/:id(/)':  'show'

  list: ->
    new ListRoute({ container: @container })

  new: ->
    new NewRoute({ container: @container })

  show: (id) ->
    new ShowRoute({ container: @container, id: id })

# # # # #

module.exports = new ContactRouter({ container: window.Layout.mainRegion })
