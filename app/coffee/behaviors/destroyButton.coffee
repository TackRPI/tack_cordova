
# DestroyButtonBehavior definition
# Used to destroy RESTful models with a confirmation
class DestroyButtonBehavior extends Marionette.Behavior

  ui:
    destroy: '[data-click=destroy]'

  events:
    'click @ui.destroy': 'onDestroyClick'

  # Options send to the Confirmations component
  confirmOptions:
    message:      'Are you sure you want to destroy this model instance?'
    confirmIcon:  'fa-times'
    confirmText:  'Remove'
    confirmCss:   'btn-danger'

  onDestroyClick: (e) ->
    e.stopPropagation()

    # Merges the default options with the options supplied
    # when the behavior is included in the view
    options = _.extend( @confirmOptions, @options )

    # Fires off request to Confirmation component
    Backbone.Radio.channel('confirm').request('show', options).then (confirmView) =>
      confirmView.on 'confirmed', => @view.model.destroy()

# # # # #

module.exports = DestroyButtonBehavior
