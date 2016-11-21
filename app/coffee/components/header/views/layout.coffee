
# HeaderView class definition
# Defines a simbple view for displaying the
# header of the application. The header displays
# the authenticated user and
# manages toggling the SidebarComponent's view
class HeaderView extends Marionette.LayoutView
  template: require './templates/header'
  className: 'nav navbar navbar-inverse navbar-static-top navbar-dark bg-inverse'

  events:
    'click .navbar-brand': 'toggleSidebar'

  toggleSidebar: ->
    Backbone.Radio.channel('sidebar').trigger('toggle')

  serializeData: ->
    { user: @options.user || 'Unauthenticated' }

# # # # #

module.exports = HeaderView
