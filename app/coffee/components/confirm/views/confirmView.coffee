_           = require 'underscore'
Marionette  = require 'backbone.marionette'

# # # # #

# TODO - document
class ConfirmView extends Marionette.LayoutView
  className: 'modal-content'
  template: require './templates/confirm_view'

  ui:
    deny:     '[data-click=deny]'
    confirm:  '[data-click=confirm]'

  triggers:
    'click @ui.deny':     'denied'
    'click @ui.confirm':  'confirmed'

  defaultOptions:
    message:      'Are you sure?'
    messageCss:   ''

    denyIcon:     'fa-times'
    denyText:     'Cancel'
    denyCss:      'btn-secondary'

    confirmIcon:  'fa-check'
    confirmText:  'Confirm'
    confirmCss:   'btn-success'

  serializeData: ->
    return _.extend(@defaultOptions, @options)

# # # # #

module.exports = ConfirmView
