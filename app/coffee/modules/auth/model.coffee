
# Super-class Authenticator
class Authenticator extends Backbone.Model

  # TODO - abstract into AuthService?
  initialize: ->
    @on 'sync', (model, resp) => @setToken(resp)

    @on 'error', (model, resp) ->
      console.log 'AUTHENTICATOR ERROR'
      console.log model
      console.log resp

  setToken: (resp) ->
    localStorage.token  = resp.auth_token
    localStorage.user   = resp.user.email
    window.location     = '#'
    Backbone.Radio.channel('header').trigger('reset')

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
