LayoutView  = require './views/layout'

# # # # #

# NewContactMethodRoute class definition
class NewContactMethodRoute extends require '../../base/route'

  fetch: ->
    return Backbone.Radio.channel('contact_method').request('model')
    .then (model) => @model = model

  render: ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = NewContactMethodRoute
