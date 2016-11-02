RegisterRoute = require './register/route'
SignInRoute   = require './sign_in/route'

# # # # #

class AuthRouter extends Backbone.Routing.Router

  routes:
    'auth/register(/)': 'register'
    'auth/sign_in(/)':  'signIn'

  register: ->
    new RegisterRoute({ container: window.Container })

  signIn: ->
    new SignInRoute({ container: window.Container })

# # # # #

module.exports = new AuthRouter()
