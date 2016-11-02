LayoutView  = require './views/layout'

# # # # #

class ShareProfileListRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: ->
    return Backbone.Radio.channel('share_profile').request('collection')
    .then (collection) => @collection = collection

  render: (id) ->
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = ShareProfileListRoute
