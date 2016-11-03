LayoutView  = require './views/layout'

# # # # #

class ResetRoute extends Backbone.Routing.Route

  initialize: (options={}) -> # TODO - get rid of this boilerplate
    @container = options.container

  fetch: ->
    @model = Backbone.Radio.channel('auth').request('password:resetter')

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = ResetRoute
