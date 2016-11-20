
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
    window.location = '#contact_methods' # TODO - redirection, state service?

  onSubmit: (e) ->
    attrs = Backbone.Syphon.serialize(@)
    console.log attrs
    # Backbone.channel('contact').request('add', attrs) # TODO - implement

# # # # #

module.exports = ContactAddView
