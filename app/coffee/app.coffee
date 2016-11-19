
# App config
require './config'

# Top-level layout configuration
# Pattern: singleton
window.Layout = Layout = require('./views/appLayout')

# Components
# TODO - what are components? - routeless services with views
# Generally accessible anywhere in the application
HeaderComponent   = require './modules/header/component'
ConfirmComponent  = require './components/confirm'
SidebarComponent  = require './components/sidebar/component'
FlashComponent    = require './components/flash/component'

# Modules
# TODO - what are modules? - they have routes
HomeModule = require './modules/home/router'
ContactModule = require './modules/contact/router'
ContactMethodModule = require './modules/contact_method/router'
ShareProfileModule = require './modules/share_profile/router'
AuthModule = require './modules/auth/router'
# DeviceModule = require './modules/device/router'

# # # # # #

# Starts application
$(document).on 'ready', =>
  console.log 'Document Ready'

  # TODO - this should be moved into the Cordova Application
  # This should be part of the application lifecycle
  Backbone.history.start()
  Backbone.Radio.channel('header').trigger('reset')
  Backbone.Radio.channel('sidebar').trigger('initialize')
