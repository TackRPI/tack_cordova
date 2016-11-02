
class ContactMethodForm extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    SubmitButton: {}

  onSubmit: (e) ->
    console.log 'ON SUBMIT'
    console.log Backbone.Syphon.serialize(@)

# # # # #

module.exports = ContactMethodForm
