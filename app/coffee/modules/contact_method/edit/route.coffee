LayoutView  = require './views/layout'

# # # # #

# ContactMethodEditRoute class definition
class ContactMethodEditRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: (id) ->
    return Backbone.Radio.channel('contact_method').request('model', id)
    .then (model) => @model = model

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = ContactMethodEditRoute
