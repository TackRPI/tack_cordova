
class DeviceChild extends Marionette.LayoutView
  template: require './templates/device_child'
  tagName: 'li'
  className: 'list-group-item'

class DeviceList extends Marionette.CollectionView
  childView: DeviceChild

class BluetoothList extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  regions:
    devicesRegion: '[data-region=devices]'

  onRender: ->
    @devicesRegion.show new DeviceList({ collection: @collection })

# # # # #

module.exports = BluetoothList
