LayoutView  = require './views/layout'

# # # # #

# SignInRoute class definition
class SignInRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: ->
    @model = Backbone.Radio.channel('auth').request('authenticator')

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = SignInRoute
