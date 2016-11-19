
# TODO - document
class ConfirmationsBehavior extends Marionette.Behavior

  # FEATURE - we may want to support confirmEvents hash, could prove helpful
  # if we need multiple confirmations in one view
  # confirmEvents:
  #   'denied':     'onDeny'
  #   'confirmed':  'onConfirm'

  events:
    'click @ui.confirmationTrigger': 'showConfirmation'

  showConfirmation: (e) ->
    e.stopPropagation()

    Backbone.Radio.channel('confirm').request('show', @options).then (confirmView) =>
      confirmView.on 'confirmed', => @view.triggerMethod('confirmed')
      confirmView.on 'denied',    => @view.triggerMethod('denied')

# # # # #

module.exports = ConfirmationsBehavior
