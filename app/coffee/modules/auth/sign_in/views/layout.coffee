
# SignInLayout view class defintion
# The SignInLayout provides a form for an end-user
# to sign in to Tack. It makes liberal use of behavioral
# abstraction to reduce code that would otherwise be repeated in similar views.
# Note - this is almost identical to the RegisterLayout view
class SignInLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    SubmitButton: {}
    ModelEvents: {}
    BindInputs: {}
    Flashes:
      success:
        message:  'Authentication successful.'
      error:
        message:  'Authentication error.'

  modelEvents:
    'change': 'validate'

  # TODO - this validation should happen on the Authenticator model
  validate: ->
    data = Backbone.Syphon.serialize(@)
    return @enableSubmit() if data.email && data.password
    return @disableSubmit()

  onRender: ->
    @validate()

  onSubmit: ->
    @model.save(Backbone.Syphon.serialize(@))

  onRequest: ->
    @disableSubmit()

  onError: ->
    @flashError()

  onSync: ->
    @flashSuccess()

# # # # #

module.exports = SignInLayout
