Models = require './model'

# # # # #

class AuthService extends Marionette.Service

  radioRequests:
    'auth authenticator':     'authenticator'
    'auth registrar':         'registrar'
    'auth password:resetter': 'passwordResetter'
    'auth is:authenticated':  'isAuthenticated'
    'auth user':              'username'
    'auth logout':            'logout'
    'auth set:token':         'setToken'

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

  logout: -> # Ideally this should be a session, setter as well
    delete localStorage.user
    delete localStorage.token
    window.location = '#'
    Backbone.Radio.channel('header').trigger('reset')

  setToken: (resp) ->
    localStorage.token  = resp.auth_token
    localStorage.user   = resp.user.email
    window.location     = '#'
    Backbone.Radio.channel('header').trigger('reset')

# # # # #

module.exports = new AuthService()
