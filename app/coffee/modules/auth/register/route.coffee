LayoutView  = require './views/layout'

# # # # #

class RegisterRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: ->
    @model = Backbone.Radio.channel('auth').request('registrar')

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = RegisterRoute
