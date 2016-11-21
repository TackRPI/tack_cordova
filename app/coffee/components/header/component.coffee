LayoutView = require './views/layout'

# TODO - document
class HeaderService extends Marionette.Service

  initialize: ->
    @container = @options.container

  radioEvents:
    'header reset': 'reset'

  reset: ->
    @user = Backbone.Radio.channel('auth').request('user')
    @container.show new LayoutView({ user: @user })

# # # # #

module.exports = new HeaderService({ container: window.Layout.headerRegion })
