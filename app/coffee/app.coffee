
# Application configuration manifest
require './config'

# Application class definition
App = require './cordova_app'

# Top-level layout configuration - singleton global variable
window.Layout = Layout = require './views/appLayout'

# Services are routeless, viewless background workers
# We currently use a single service to manage sending SMS
# and requesting requisite permissions
require './services/sms'

# Components routeless services with views that are
# accessible anywhere in the application
# Used to manage the header, sidebar, flash, and confirm UI elements
require './components/header/component'
require './components/sidebar/component'
require './components/flash/component'
require './components/confirm/component'

# Modules
# Modules represent collections of endpoints in the application.
# They have routes and entities (models and collections)
# Each route represents an endpoint, or 'page' in the app.
require './modules/auth/router'
require './modules/contact/router'
require './modules/contact_method/router'
require './modules/home/router'
require './modules/share_profile/router'
require './modules/share/router'
require './modules/update_dispatch/router'

# # # # # #

# Page has loaded, document is ready
$(document).on 'ready', =>
  app = new App() # Instantiates new App

