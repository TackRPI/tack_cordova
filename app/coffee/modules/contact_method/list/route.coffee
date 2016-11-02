LayoutView  = require './views/layout'

# # # # #

class ContactListRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: ->
    return Backbone.Radio.channel('contact_method').request('collection')
    .then (contacts) => @collection = contacts

  render: (id) ->
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = ContactListRoute
