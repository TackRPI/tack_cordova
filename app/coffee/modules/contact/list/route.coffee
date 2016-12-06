LayoutView  = require './views/layout'

# # # # #

# ContactListRoute class definition
class ContactListRoute extends require '../../base/route'

  fetch: ->
    return Backbone.Radio.channel('contact').request('collection')
    .then (collection) => @collection = collection

  render: (id) ->
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = ContactListRoute
