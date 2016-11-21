
# RegisterLayout view class defintion
# The RegisterLayout provides a form for an end-user
# to sign up for Tack. It makes liberal use of behavioral
# abstraction to reduce code that would otherwise be repeated in similar views.
class RegisterLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    SubmitButton: {}
    ModelEvents: {}
    BindInputs: {}
    Flashes:
      success:
        message:  'Registration successful.'
      error:
        message:  'Registration error.'

  modelEvents:
    'change': 'validate'

  # TODO - this validation should happen on the Registrar model
  validate: ->
    data = Backbone.Syphon.serialize(@)
    return @enableSubmit() if data.email && data.username && data.display_name && data.password && data.password_confirmation && (data.password == data.password_confirmation)
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

module.exports = RegisterLayout
