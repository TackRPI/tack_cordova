
# TODO - document
# TODO - this is almost identical to the register layout
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

  validate: ->
    data = Backbone.Syphon.serialize(@)
    return @enableSubmit() if data.email && data.password # TODO - break this out into a model validation
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
