
# Config
require './config'


# # # # #

# TODO - clean up this file
# Should only be a manifest of required assets for the application

# Cordova app & configuration
# CordovaApp = require './cordova_app'
# window.SmsWorker = SmsWorker = require './sms'

window.Container = require './views/appLayout'

# # # # #

HomeModule = require './modules/home/router'
ContactModule = require './modules/contact/router'
DeviceModule = require './modules/device/router'
ContactMethodModule = require './modules/contact_method/router'
ShareProfileModule = require './modules/share_profile/router'

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

  # TODO - this should be moved into the Cordova Application
  # This should be part of the application lifecycle
  Backbone.history.start()
