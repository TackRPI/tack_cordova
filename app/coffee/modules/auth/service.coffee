Models = require './model'

# # # # #

# TODO - documentation
class AuthService extends Marionette.Service

  radioRequests:
    'auth authenticator':     'authenticator'
    'auth registrar':         'registrar'
    'auth is:authenticated':  'isAuthenticated'
    'auth user':              'username'
    'auth logout':            'logout'
    'auth set:token':         'setToken'

  authenticator: ->
    return new Models.Authenticator()

  registrar: ->
    return new Models.Registrar()

  isAuthenticated: ->
    user = localStorage.user
    token = localStorage.token
    return !!(user && token)

  username: ->
    return localStorage.user

  logout: ->
    delete localStorage.user
    delete localStorage.token
    Backbone.Radio.channel('app').trigger('redirect', '#')
    Backbone.Radio.channel('header').trigger('reset')
    Backbone.Radio.channel('sidebar').trigger('hide')

  setToken: (resp) ->
    localStorage.token  = resp.auth_token
    localStorage.user   = resp.user.email
    Backbone.Radio.channel('app').trigger('redirect', '#contact_methods')
    Backbone.Radio.channel('header').trigger('reset')
    Backbone.Radio.channel('sidebar').trigger('hide')

# # # # #

module.exports = new AuthService()
