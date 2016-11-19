Service = require './service'
ListRoute = require './list/route'
AddRoute = require './add/route'
ShowRoute = require './show/route'

# # # # #

class ContactRouter extends require '../base/router'

  routes:
    'contacts(/)':          'list'
    'contacts/add(/)':      'add'
    'updates/:id(/)':      'show'


  list: ->
    new ListRoute({ container: @container })

  add: ->
    new AddRoute({ container: @container })

  show: (id) ->
    new ShowRoute({ container: @container, id: id })

# # # # #

module.exports = new ContactRouter({ container: window.Layout.mainRegion })
