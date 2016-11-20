Service = require './service'
ListRoute = require './list/route'
ShowRoute = require './show/route'

AddBluetoothRoute = require './add_bluetooth/route'
AddManualRoute    = require './add_manual/route'

# # # # #

class ContactRouter extends require '../base/router'

  routes:
    'contacts(/)':            'list'
    'contacts/add_bt(/)':     'addBluetooth'
    'contacts/add_manual(/)': 'addManual'
    'updates/:id(/)':         'show'

  list: ->
    new ListRoute({ container: @container })

  addBluetooth: ->
    console.log 'ADD BLUETOOTH'
    new AddBluetoothRoute({ container: @container })

  addManual: ->
    console.log 'MANUAL'
    new AddManualRoute({ container: @container })

  show: (id) ->
    new ShowRoute({ container: @container, id: id })

# # # # #

module.exports = new ContactRouter({ container: window.Layout.mainRegion })
