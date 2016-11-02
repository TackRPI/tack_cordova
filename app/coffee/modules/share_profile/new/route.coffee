LayoutView  = require './views/layout'

# # # # #

class NewShareProfileRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: ->
    return Backbone.Radio.channel('share_profile').request('model')
    .then (model) => @model = model

  render: ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = NewShareProfileRoute
