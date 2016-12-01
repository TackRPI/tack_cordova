
class LogoutLayout extends Marionette.LayoutView
  template: require './templates/logout'
  className: 'container-fluid'

  ui:
    confirmationTrigger: '[data-click=confirm]'

  behaviors:
    Confirmations:
      message:      'Are you sure you want to Logout?'
      confirmIcon:  'fa-times'
      confirmText:  'Logout'
      confirmCss:   'btn-danger'

  onConfirmed: ->
    Backbone.Radio.channel('auth').request('logout')

# # # # #

module.exports = LogoutLayout
