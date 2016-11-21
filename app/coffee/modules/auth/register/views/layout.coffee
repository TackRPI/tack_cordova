
# TODO - document
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

  validate: ->
    data = Backbone.Syphon.serialize(@)
    return @enableSubmit() if data.email && data.username && data.display_name && data.password && data.password_confirmation && (data.password == data.password_confirmation) # TODO - break this out into a model validation
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
