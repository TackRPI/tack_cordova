require './service'
BaseRouter    = require '../base/router'
RegisterRoute = require './register/route'
SignInRoute   = require './sign_in/route'
LogoutRoute   = require './logout/route'

# # # # #

class AuthRouter extends BaseRouter

  routes:
    'auth/register(/)': 'register'
    'auth/sign_in(/)':  'signIn'
    'auth/logout(/)':   'logout'

  register: ->
    new RegisterRoute({ container: @container })

  signIn: ->
    new SignInRoute({ container: @container })

  logout: ->
    new LogoutRoute({ container: @container })

# # # # #

module.exports = new AuthRouter({ container: window.Layout.mainRegion })
