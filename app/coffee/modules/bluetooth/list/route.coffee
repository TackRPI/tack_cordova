LayoutView  = require './views/layout'

# # # # #

class BluetoothRoute extends require '../../base/route'

  fetch: ->
    @collection = Backbone.Radio.channel('bluetooth').request('collection')

  render: ->
    console.log @collection
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = BluetoothRoute
