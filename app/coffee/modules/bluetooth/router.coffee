ConnectRoute = require './add_bluetooth/route'

# # # # #

class BluetoothRouter extends Backbone.Routing.Router

  routes:
    'bluetooth/connect(/)': 'connect'

  connect: ->
    new ListRoute({ container: @container })

# # # # #

module.exports = new BluetoothRouter({ container: window.Layout.mainRegion })
