Models = require './model'

# # # # #

class AuthService extends Marionette.Service

  radioRequests:
    'auth authenticator':     'authenticator'
    'auth registrar':         'registrar'
    'auth password:resetter': 'passwordResetter'

  authenticator: ->
    return new Models.Authenticator()

  registrar: ->
    return new Models.Registrar()

  passwordResetter: ->
    return new Models.PasswordResetter()

# # # # #

module.exports = new AuthService()
