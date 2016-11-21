
# Super-class Authenticator
class Authenticator extends Backbone.Model

  # Adds listener to set authentication
  # token on successful response from the server
  initialize: ->
    @on 'sync', (model, resp) => @setToken(resp)

  setToken: (resp) ->
    Backbone.Radio.channel('auth').request('set:token', resp)

# User Authentication Subclass
class UserAuthenticator extends Authenticator
  urlRoot: '/auth_user'

  defaults:
    email:    ''
    password: ''

# User Registration Subclass
class UserRegistrar extends Authenticator
  urlRoot: '/auth/register'

  defaults:
    email:    ''
    password: ''
    password_confirmation: ''

# # # # #

# Exports all models
module.exports =
  Authenticator:    UserAuthenticator
  Registrar:        UserRegistrar
