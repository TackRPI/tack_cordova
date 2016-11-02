
class ContactMethodForm extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    ModelEvents: {}
    SubmitButton: {}

  onSubmit: (e) ->
    attrs = Backbone.Syphon.serialize(@)
    @model.save(attrs)

  onRequest: ->
    console.log 'ON REQUEST'

  onError: ->
    console.log 'ON ERROR'

  onSync: ->
    console.log 'ON SYNC'

# # # # #

module.exports = ContactMethodForm
