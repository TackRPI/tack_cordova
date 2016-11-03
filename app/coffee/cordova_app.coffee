# # # # #

# Cordova app & configuration
# CordovaApp = require './cordova_app'
# window.SmsWorker = SmsWorker = require './sms'

# Cordova plugins
#   Contacts    https://github.com/apache/cordova-plugin-contacts
#   SMS         https://github.com/cordova-sms/cordova-sms-plugin
#   BLE         https://github.com/don/cordova-plugin-ble-central

# TODO - device feedback
# plugins?.deviceFeedback.haptic()
# plugins?.deviceFeedback.acoustic()
# # # # #

# TODO - this should handle the application lifecycle
class CordovaApp

  constructor: ->
    console.log 'constructor'
    @initialize()

  initialize: ->
    console.log 'initialize'
    @bindEvents()
    return

  bindEvents: ->
    console.log 'bindEvents'

    # onDeviceReadyCallback = ->
    #   console.log 'ON DEVICE READY!!'

    # document.addEventListener 'deviceready', onDeviceReadyCallback, false

  # onDeviceReady: ->
  #   console.log 'Device ready - list contacts.'

  #   # https://github.com/apache/cordova-plugin-contacts
  #   # console.log navigator.contacts

  # receivedEvent: (id) ->
  #   console.log 'Received event: ', id

# # # # #

module.exports = CordovaApp
