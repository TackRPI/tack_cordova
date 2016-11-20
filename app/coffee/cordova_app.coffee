# # # # #

# Cordova app & configuration
# CordovaApp = require './cordova_app'
# window.SmsWorker = SmsWorker = require './sms'

# Cordova plugins
#   Contacts    https://github.com/apache/cordova-plugin-contacts
#   SMS         https://github.com/cordova-sms/cordova-sms-plugin
#   BLE         https://github.com/don/cordova-plugin-ble-central

# # # # #

# TODO - documentation
# this handles application lifecycle
# 'deviceready' event is fired when the cordova framework has successfully
# bootstrapped the mobile device on which the app is running
class CordovaApp

  constructor: ->
    @initialize()

  initialize: ->
    document.addEventListener 'deviceready', @onDeviceReady, false
    return true

  onDeviceReady: ->
    Backbone.history.start()
    Backbone.Radio.channel('header').trigger('reset')
    Backbone.Radio.channel('sidebar').trigger('reset')
    Backbone.Radio.channel('app').trigger('start')

# # # # #

module.exports = CordovaApp
