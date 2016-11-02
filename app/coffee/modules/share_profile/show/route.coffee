LayoutView  = require './views/layout'

# # # # #

class ShareProfileShowRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: (id) ->
    return Backbone.Radio.channel('share_profile').request('model', id)
    .then (model) => @model = model

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = ShareProfileShowRoute
