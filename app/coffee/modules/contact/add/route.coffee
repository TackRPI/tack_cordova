LayoutView  = require './views/layout'

# # # # #

class ContactAddRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  # fetch: (id) ->
  #   return Backbone.Radio.channel('contact').request('model', id)
  #   .then (model) => @model = model

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = ContactAddRoute
