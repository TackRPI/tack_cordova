
class ShareProfileForm extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'row'

  behaviors:
    ModelEvents: {}
    SubmitButton: {}

  onRender: ->
    Backbone.Syphon.deserialize( @, @model.attributes )

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

module.exports = ShareProfileForm
