
class BtModel extends Backbone.Model

class BtCollection extends Backbone.Collection
  model: BtModel

# # # # #

class BluetoothService extends Marionette.Service

  radioEvents:
    'app start': 'initializeBt'

  radioRequests:
    'bluetooth initialize':  'initializeBt'
    'bluetooth start:scan':  'startScan'
    'bluetooth stop:scan': 'stopScan'
    'bluetooth has:permission': 'hasPermission'
    'bluetooth request:permission': 'requestPermission'
    'bluetooth collection': 'collection'
    'bluetooth start:advertising': 'startAdvertising'
    'bluetooth add:service': 'addService'

  initialize: ->
    @cached = new BtCollection()

  collection: =>
    @startScan()
    return @cached

  initializeBt: ->
    onSuccess = (obj) =>
      console.log 'initialization success'
      console.log obj.success
      @requestPermission()

    bluetoothle.initialize(onSuccess, {request: true})

  startScan: =>
    window.devices = @cached

    onSuccess = (obj) =>
      return unless obj.status == 'scanResult'
      # console.log obj
      obj.id = obj.address
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

    return true

  # # # # #

  stopScan: =>
    onSuccess = (obj) => console.log 'success stopping'
    onError = (obj) => console.log 'error stopping'
    bluetoothle.stopScan(onSuccess, onError)

  # # # # #

  startAdvertising: ->

    onSuccess = (obj) =>
      console.log 'success'
      console.log obj

    onError = (obj) =>
      console.log 'error'
      console.log obj

    params =
      service:  "1234", # //Android
      name:     "Tack Application"

    bluetoothle.startAdvertising(onSuccess, onError, params)

  addService: =>
    params = {
      service: "1234",
      characteristics: [
        {
          uuid: "ABCD",
          permissions: {
            read: true,
            write: true,
            # readEncryptionRequired: false,
            # writeEncryptionRequired: false,
          },
          properties : {
            read: true,
            writeWithoutResponse: true,
            write: true,
            notify: true,
            indicate: true,
            # authenticatedSignedWrites: false,
            # notifyEncryptionRequired: false,
            # indicateEncryptionRequired: false,
          }
        }
      ]
    }

    onSuccess = (obj) =>
      console.log 'success add service'
      console.log obj

    onError = (obj) =>
      console.log 'error add service'
      console.log obj

    bluetoothle.addService(onSuccess, onError, params)

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
