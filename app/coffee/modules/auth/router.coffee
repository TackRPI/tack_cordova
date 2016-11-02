Service = require './service'
RegisterRoute = require './register/route'

# # # # #

class AuthRouter extends Backbone.Routing.Router

  routes:
    'auth/register(/)': 'register'
    'auth/sign_in(/)':  'signIn'

  register: ->
    console.log 'REGISTER'
    # new ListRoute({ container: window.Container })

  signIn: ->
    console.log 'SIGN In'

# # # # #

module.exports = new AuthRouter()
