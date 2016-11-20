LayoutView  = require './views/layout'

# # # # #

class BluetoothRoute extends require '../../base/route'

  fetch: ->
    return Backbone.Radio.channel('bluetooth').request('collection')
    .then (collection) => @collection = collection

  render: (id) ->
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = BluetoothRoute
