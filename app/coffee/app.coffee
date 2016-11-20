
# App config
require './config'

# Application object
App = require './cordova_app'

# Top-level layout configuration
# Pattern: singleton
window.Layout = Layout = require('./views/appLayout')

# Services
# TODO - what are services? - Routeless, viewless background workers
# We currently use a single service to manage sending SMS
# and requesting requisite permissions
require './services/sms'

# Components
# TODO - what are components? - routeless services with views
# Generally accessible anywhere in the application
require './components/header/component'
require './components/sidebar/component'
require './components/flash/component'
require './components/confirm/component'

# Modules
# TODO - what are modules? - they have routes & entities
# they contain 'routes' which represent end-points in the app
require './modules/auth/router'
# require './modules/bluetooth/router'
require './modules/contact/router'
require './modules/contact_method/router'
require './modules/home/router'
require './modules/share_profile/router'
require './modules/update_dispatch/router'
# require './modules/device/router'

# # # # # #

# Starts application
$(document).on 'ready', =>

  # Instantiates and new App
  app = new App()

  # TODO - this is debug only
  # app.onDeviceReady()

