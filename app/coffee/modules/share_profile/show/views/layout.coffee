
class ContactShowLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    ModelEvents: {}

    DestroyButton:
      message: 'Are you sure you want to destroy this Share Profile?'

    Flashes:
      success:
        message:  'Share Profile destroyed.'
      error:
        message:  'Error destroying Share Profile.'

  serializeData: ->
    data = super
    data.json = JSON.stringify(@model.toJSON(), null, 2).split("\n")
    return data

  onSync: ->
    @flashSuccess()
    window.location = '#share_profiles' # TODO - handle redirection in state service?

  onError: ->
    @flashError()

# # # # #

module.exports = ContactShowLayout
