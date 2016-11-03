
class LogoutLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    SubmitButton: {}

  onSubmit: ->
    Backbone.Radio.channel('auth').request('logout')

# # # # #

module.exports = LogoutLayout
