LayoutView  = require './views/layout'

# # # # #

# ContactShowRoute class definition
class ContactShowRoute extends require '../../base/route'

  fetch: (id) ->
    return Backbone.Radio.channel('contact').request('model', id)
    .then (model) => @model = model

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = ContactShowRoute
