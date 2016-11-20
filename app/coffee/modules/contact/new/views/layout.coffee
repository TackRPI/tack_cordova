
class ContactAddView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    ModelEvents: {}
    SubmitButton: {}

    Flashes:
      success:
        message:  'Contact created.'
      error:
        message:  'Error creating Contact.'

  onRequest: ->
    @disableSubmit() # TODO - disable inputs as well?

  onError: ->
    @flashError()
    @enableSubmit()

  onSync: ->
    @flashSuccess()
    window.location = '#contacts' # TODO - redirection, state service?

  onSubmit: (e) ->
    attrs = Backbone.Syphon.serialize(@)
    @model.save(attrs)

# # # # #

module.exports = ContactAddView
