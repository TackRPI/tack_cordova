LayoutView  = require './views/layout'

# # # # #

class BluetoothRoute extends require '../../base/route'

  fetch: (id) ->
    return Backbone.Radio.channel('contact').request('model', id)
    .then (model) => @model = model

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = BluetoothRoute
