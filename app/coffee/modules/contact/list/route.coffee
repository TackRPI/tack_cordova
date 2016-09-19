LayoutView  = require './views/layout'

# # # # #

class ContactListRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: ->
    @container.show new window.LoadingView()

    return Backbone.Radio.channel('contact').request('collection').then (contacts) =>
      @collection = contacts

  render: (id) ->
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = ContactListRoute
