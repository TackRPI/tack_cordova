require './service'
ListRoute     = require './list/route'
ConnectRoute  = require './connect/route'

# # # # #

class BluetoothRouter extends require '../base/router'

  routes:
    'bluetooth/devices(/)': 'devices'
    'bluetooth/connect(/)': 'connect'

  devices: ->
    console.log 'LIST DEVICES'
    new ListRoute({ container: @container })

  connect: ->
    console.log 'connnect?'
    console.log @container
    new ConnectRoute({ container: @container })

# # # # #

module.exports = new BluetoothRouter({ container: window.Layout.mainRegion })
