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
    document.addEventListener 'deviceready', @onDeviceReady, false
    return

  onDeviceReady: ->
    Backbone.history.start()
    Backbone.Radio.channel('header').trigger('reset')
    Backbone.Radio.channel('sidebar').trigger('reset')

# # # # #

module.exports = CordovaApp
