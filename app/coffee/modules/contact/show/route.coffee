LayoutView  = require './views/layout'

# # # # #

class ContactShowRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: (id) ->
    @container.show new window.LoadingView()

    return Backbone.Radio.channel('contact').request('model', id).then (contact) =>
      @model = contact

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = ContactShowRoute
