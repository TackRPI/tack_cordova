LayoutView = require './views/layout'

class HeaderService extends Marionette.Service

  initialize: ->
    @container = window.AppLayout.header

  radioEvents:
    'header reset': 'reset'

  reset: ->
    @user = Backbone.Radio.channel('auth').request('user')
    @container.show new LayoutView({ user: @user })

# # # # #

module.exports = new HeaderService()
