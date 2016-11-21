
# App config
require './config'

# Application object
App = require './cordova_app'

# Top-level layout configuration - singleton global variable
window.Layout = Layout = require './views/appLayout'

# Services are routeless, viewless background workers
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
require './modules/contact/router'
require './modules/contact_method/router'
require './modules/home/router'
require './modules/share_profile/router'
require './modules/share/router'
require './modules/update_dispatch/router'

# # # # # #

# Starts application
$(document).on 'ready', =>
  app = new App() # Instantiates new App

