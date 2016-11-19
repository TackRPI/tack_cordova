
class HeaderView extends Marionette.LayoutView
  template: require './templates/header'
  className: 'nav navbar navbar-inverse navbar-static-top'

  serializeData: ->
    { user: @options.user || 'Unauthenticated' }

# # # # #

module.exports = HeaderView
