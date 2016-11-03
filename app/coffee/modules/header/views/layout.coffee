
class HeaderView extends Marionette.LayoutView
  template: require './templates/header'

  serializeData: ->
    { user: @options.user || 'Unauthenticated' }

# # # # #

module.exports = HeaderView
