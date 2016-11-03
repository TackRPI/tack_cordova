
class UserAuthenticator extends Backbone.Model
  urlRoot: '/auth_user'

  defaults:
    email:    ''
    password: ''

# # # # #

class SignInLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    SubmitButton: {}

  # TODO - this should be abstracted into an authentication service
  onSubmit: ->
    attrs = Backbone.Syphon.serialize(@)
    authenticator = new UserAuthenticator()
    authenticator.on 'sync', (model, resp) -> localStorage.token = resp.auth_token
    authenticator.save(attrs)

# # # # #

module.exports = SignInLayout
