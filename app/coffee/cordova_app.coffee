
# TODO - documentation
# this handles application lifecycle
# 'deviceready' event is fired when the cordova framework has successfully
# bootstrapped the mobile device on which the app is running
class CordovaApp

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
