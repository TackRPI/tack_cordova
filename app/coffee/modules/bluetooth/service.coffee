
class BtModel extends Backbone.Collection

class BtCollection extends Backbone.Collection
  model: BtModel

# # # # #

class BluetoothService extends Marionette.Service

  radioRequests:
    'bluetooth initialize':  'initializeBt'
    'bluetooth start:scan':  'startScan'
    'bluetooth stop:scan': 'stopScan'
    'bluetooth has:permission': 'hasPermission'
    'bluetooth request:permission': 'requestPermission'

  initializeBt: ->
    onSuccess = (obj) =>
      console.log 'initialization success'
      console.log obj.success

    bluetoothle.initialize(onSuccess, {request: true})

  # # # # #

  startScan: =>
    @cached ||= new BtCollection()
    @cached.reset([])

    onSuccess = (obj) =>
      return unless obj.status == 'scanResult'
      console.log obj
      @cached.add(obj)

    onError = (obj) =>
      console.log 'error'
      console.log obj

    params =
      "services": []
      "scanMode": bluetoothle.SCAN_MODE_LOW_LATENCY,
      "matchMode": bluetoothle.MATCH_MODE_AGGRESSIVE,
      "matchNum": bluetoothle.MATCH_NUM_MAX_ADVERTISEMENT,
      "callbackType": bluetoothle.CALLBACK_TYPE_ALL_MATCHES,

    bluetoothle.startScan(onSuccess, onError, params)

    setTimeout( @stopScan, 5000 )

  # # # # #

  stopScan: =>
    onSuccess = (obj) => console.log 'success stopping'
    onError = (obj) => console.log 'error stopping'
    bluetoothle.stopScan(onSuccess, onError)

  # # # # #

  startAdvertising: ->
    console.log 'ON INITIALIZED'

    onSuccess = (obj) =>
      console.log 'success'
      console.log obj

    onError = (obj) =>
      console.log 'error'
      console.log obj

    params = {
      service:  "1234", # //Android
      name:     "Tack Application"
    }

    bluetoothle.startAdvertising(onSuccess, onError, params)

  # # # # #

  hasPermission: ->
    onSuccess = (obj) =>
      console.log 'HAS PERMISSION'
      console.log obj

    bluetoothle.hasPermission(onSuccess)

  # # # # #

  requestPermission: ->
    onSuccess = (obj) =>
      console.log 'ENABLED PERMISSION'
      console.log obj

    onError = (obj) =>
      console.log 'DIDNT ENABLE PERMISSION'
      console.log obj

    bluetoothle.requestPermission(onSuccess, onError)

# # # # #

module.exports = new BluetoothService()
