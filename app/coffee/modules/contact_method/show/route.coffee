LayoutView  = require './views/layout'

# # # # #

# ContactMethodShowRoute class definition
class ContactMethodShowRoute extends require '../../base/route'

  fetch: (id) ->
    return Backbone.Radio.channel('contact_method').request('model', id)
    .then (method) => @model = method

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = ContactMethodShowRoute
