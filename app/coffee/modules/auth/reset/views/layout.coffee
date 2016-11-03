
class ResetLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    SubmitButton: {}

  # TODO - all auth views are the same except for templates
  onSubmit: ->
    attrs = Backbone.Syphon.serialize(@)
    @model.save(attrs)

# # # # #

module.exports = ResetLayout
