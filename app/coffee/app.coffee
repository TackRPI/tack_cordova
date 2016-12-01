
# CordovaApp class definition
# Manages lifecycle and bootstraps application
# mobile device on which the app is running
class CordovaApp extends Marionette.Service

  radioEvents:
    'app redirect': 'redirectTo'

  initialize: ->

    # Listener for 'deviceready' event
    # fired when the Cordova framework has successfully initialized
    document.addEventListener 'deviceready', @onDeviceReady, false

    # Starts application without 'deviceready' event
    # Used while debugging the application in-browser
    # window.Contact is only defined when the app is running
    # on a mobile device
    setTimeout( =>
      @onDeviceReady() unless window.Contact
    , 1000)

    return true

  # Starts the application
  # Starts Backbone.history (enables routing)
  # And initializes header and sidebar modules
  onDeviceReady: ->
    Backbone.history.start()
    Backbone.Radio.channel('header').trigger('reset')
    Backbone.Radio.channel('sidebar').trigger('reset')
    Backbone.Radio.channel('app').trigger('start')

  # Redirection interface
  # Used accross the application to redirect
  # to specific views after specific actions
  redirectTo: (route) ->
    window.location = route
    return true

# # # # #

module.exports = CordovaApp
