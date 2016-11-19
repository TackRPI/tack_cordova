require './service'
BaseRouter    = require '../base/router'
RegisterRoute = require './register/route'
SignInRoute   = require './sign_in/route'
ResetRoute    = require './reset/route'
LogoutRoute   = require './logout/route'

# # # # #

class AuthRouter extends BaseRouter

  routes:
    'auth/register(/)': 'register'
    'auth/sign_in(/)':  'signIn'
    'auth/reset(/)':    'reset'
    'auth/logout(/)':   'logout'

  register: ->
    new RegisterRoute({ container: @container })

  signIn: ->
    new SignInRoute({ container: @container })

  reset: ->
    new ResetRoute({ container: @container })

  logout: ->
    new LogoutRoute({ container: @container })

# # # # #

module.exports = new AuthRouter({ container: window.Layout.mainRegion })
