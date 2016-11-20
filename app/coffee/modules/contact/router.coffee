Service = require './service'
ListRoute = require './list/route'
ShowRoute = require './show/route'
AddBluetoothRoute = require './add_bluetooth/route'
AddManualRoute    = require './add_manual/route'

# # # # #

class ContactRouter extends Backbone.Routing.Router

  routes:
    'contacts(/)':          'list'
    'contacts/add_bt(/)':     'addBluetooth'
    'contacts/add_manual(/)': 'addManual'
    'contacts/:id(/)':      'show'

  list: ->
    new ListRoute({ container: @container })

  addBluetooth: ->
    new AddBluetoothRoute({ container: @container })

  addManual: ->
    new AddManualRoute({ container: @container })

  show: (id) ->
    new ShowRoute({ container: @container, id: id })

# # # # #

module.exports = new ContactRouter()
