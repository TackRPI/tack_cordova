
# Config
require './config'


# # # # #

# TODO - clean up this file
# Should only be a manifest of required assets for the application

# Cordova app & configuration
# CordovaApp = require './cordova_app'
# window.SmsWorker = SmsWorker = require './sms'

window.Container = require './config/layout'
window.LoadingView = require './views/loading'

# # # # #

HomeModule = require './modules/home/router'
ContactModule = require './modules/contact/router'
DeviceModule = require './modules/device/router'
ContactMethodModule = require './modules/contact_method/router'

# # # # #

# Cordova plugins
#   Contacts    https://github.com/apache/cordova-plugin-contacts
#   SMS         https://github.com/cordova-sms/cordova-sms-plugin
#   BLE         https://github.com/don/cordova-plugin-ble-central

# TODO - device feedback
# plugins?.deviceFeedback.haptic()
# plugins?.deviceFeedback.acoustic()

# # # # # #

$(document).on 'ready', =>
  console.log 'Document Ready'
  Backbone.history.start()

  # TODOD - this should be removed completely
  $('.navbar-brand').on 'click', ->
    for nav in $('.nav-item')
      $(nav).find('.nav-link').removeClass('active')

  $('.nav-item').on 'click', ->
    # console.log 'clicked'
    # console.log $(@)
    $(@).find('.nav-link').addClass('active')

    for nav in $(@).siblings('.nav-item')
      $(nav).find('.nav-link').removeClass('active')
