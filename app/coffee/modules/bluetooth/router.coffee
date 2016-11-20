ConnectRoute = require './connect/route'

# # # # #

class BluetoothRouter extends require '../base/router'

  routes:
    'bluetooth/connect(/)': 'connect'

  connect: ->
    console.log 'connnect?'
    console.log @container
    new ConnectRoute({ container: @container })

# # # # #

module.exports = new BluetoothRouter({ container: window.Layout.mainRegion })
