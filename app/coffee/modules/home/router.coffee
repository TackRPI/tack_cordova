HomeRoute = require './home/route'

# # # # #

class HomeRouter extends Backbone.Routing.Router

  routes:
    '(/)':  'home'

  home: ->
    new HomeRoute({ container: @container })

# # # # #

module.exports = new HomeRouter()
