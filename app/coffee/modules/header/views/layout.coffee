
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
