LayoutView  = require './views/layout'

# # # # #

class NewRoute extends require '../../base/route'

  fetch: ->
    return Backbone.Radio.channel('contact').request('model')
    .then (model) => @model = model

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = NewRoute
