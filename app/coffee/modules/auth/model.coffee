
# Super-class Authenticator
class Authenticator extends Backbone.Model

  # TODO - abstract this into AuthService?
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

# Password Reset Model
class PasswordResetter extends Backbone.Model
  urlRoot: '/auth/reset'

  defaults:
    email:  ''

# # # # #

# Exports all models
module.exports =
  Authenticator:    UserAuthenticator
  Registrar:        UserRegistrar
  PasswordResetter: PasswordResetter
