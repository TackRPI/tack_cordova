LayoutView  = require './views/layout'

# # # # #

class ContactMethodShowRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: (id) ->
    return Backbone.Radio.channel('contact_method').request('model', id)
    .then (method) => @model = method

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = ContactMethodShowRoute
