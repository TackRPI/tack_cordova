LayoutView  = require './views/layout'

# # # # #

class LogoutRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  # fetch: ->
  #   return Backbone.Radio.channel('share_profile').request('model')
  #   .then (collection) => @collection = collection

  render: (id) ->
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = LogoutRoute
