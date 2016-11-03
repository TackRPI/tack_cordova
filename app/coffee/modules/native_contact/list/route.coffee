LayoutView  = require './views/layout'

# # # # #

class ContactListRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: ->
    return Backbone.Radio.channel('contact').request('collection')
    .then (collection) => @collection = collection

  render: (id) ->
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = ContactListRoute
