
# TODO - document
class DestroyButtonBehavior extends Marionette.Behavior

  ui:
    destroy: '[data-click=destroy]'

  events:
    'click @ui.destroy': 'onDestroyClick'

  confirmOptions:
    message:      'Are you sure you want to destroy this model instance?'
    confirmIcon:  'fa-times'
    confirmText:  'Remove'
    confirmCss:   'btn-danger'

  onDestroyClick: (e) ->
    e.stopPropagation()

    options = _.extend( @confirmOptions, @options )

    Backbone.Radio.channel('confirm').request('show', options).then (confirmView) =>
      confirmView.on 'confirmed', => @view.model.destroy()

# # # # #

module.exports = DestroyButtonBehavior
