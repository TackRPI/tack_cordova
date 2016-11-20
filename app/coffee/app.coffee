
# App config
require './config'

# Top-level layout configuration
# Pattern: singleton
window.Layout = Layout = require('./views/appLayout')

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
require './modules/bluetooth/router'
require './modules/contact/router'
require './modules/contact_method/router'
require './modules/home/router'
require './modules/share_profile/router'
require './modules/update_dispatch/router'
# require './modules/device/router'

# # # # # #

# Starts application
$(document).on 'ready', =>

  # TODO - move this into CordovaApplication, manages lifecycle
  Backbone.history.start()
  Backbone.Radio.channel('header').trigger('reset')
  Backbone.Radio.channel('sidebar').trigger('reset')
