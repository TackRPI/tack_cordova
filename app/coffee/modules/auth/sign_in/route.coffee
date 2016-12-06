LayoutView  = require './views/layout'

# # # # #

# SignInRoute class definition
class SignInRoute extends require '../../base/route'

  fetch: ->
    @model = Backbone.Radio.channel('auth').request('authenticator')

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = SignInRoute
