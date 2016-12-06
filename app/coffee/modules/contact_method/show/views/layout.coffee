# ContactMethodShowLayout class definition
# Defines a Marionette.LayoutView class to display a
# ContactMethod model instance. This view can also destroy
# the ContactMethod instance, or navigate the user to the edit page
class ContactMethodShowLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    ModelEvents: {}

    DestroyButton:
      message: 'Are you sure you want to destroy this Contact Method?'

    Flashes:
      success:
        message:  'Contact Method destroyed.'
      error:
        message:  'Error destroying Contact Method.'

  onSync: ->
    @flashSuccess()
    Backbone.Radio.channel('app').trigger('redirect','#contact_methods')

  onError: ->
    @flashError()

# # # # #

module.exports = ContactMethodShowLayout
