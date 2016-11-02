
class UserAuthenticator extends Backbone.Model
  urlRoot: '/auth_user'

  defaults:
    email:    'aeksco@gmail.com'
    password: 'topsecret'

# # # # #

class SignInLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  events:
    'click .btn': 'authenticate'

  # TODO - this should be abstracted into an authentication service
  authenticate: ->
    authenticator = new UserAuthenticator()
    authenticator.on 'sync', (model, resp) -> localStorage.token = resp.auth_token
    authenticator.save()

# # # # #

module.exports = SignInLayout
