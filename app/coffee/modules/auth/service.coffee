Models = require './model'

# # # # #

class AuthService extends Marionette.Service

  radioRequests:
    'auth authenticator':     'authenticator'
    'auth registrar':         'registrar'
    'auth password:resetter': 'passwordResetter'
    'auth is:authenticated':  'isAuthenticated'
    'auth user':              'username'

  authenticator: ->
    return new Models.Authenticator()

  registrar: ->
    return new Models.Registrar()

  passwordResetter: ->
    return new Models.PasswordResetter()

  isAuthenticated: ->
    user = localStorage.user
    token = localStorage.token
    return !!(user && token)

  username: ->
    return localStorage.user


# # # # #

module.exports = new AuthService()
