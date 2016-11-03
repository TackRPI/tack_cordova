require './service'
RegisterRoute = require './register/route'
SignInRoute   = require './sign_in/route'
ResetRoute    = require './reset/route'
LogoutRoute   = require './logout/route'

# # # # #

class AuthRouter extends Backbone.Routing.Router

  routes:
    'auth/register(/)': 'register'
    'auth/sign_in(/)':  'signIn'
    'auth/reset(/)':    'reset'
    'auth/logout(/)':   'logout'

  register: ->
    new RegisterRoute({ container: window.Container })

  signIn: ->
    new SignInRoute({ container: window.Container })

  reset: ->
    new ResetRoute({ container: window.Container })

  logout: ->
    new LogoutRoute({ container: window.Container })

# # # # #

module.exports = new AuthRouter()
