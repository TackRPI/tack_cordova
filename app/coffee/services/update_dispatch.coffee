
# TODO - document
# https://github.com/cordova-sms/cordova-sms-plugin
class SMSService extends Marionette.Service

  radioRequests:
    'sms send': 'send'

  # # # # #

  send: (number='5162876345', message='Hello from cordova') ->
    return new Promise (resolve, reject) =>

      # Options
      options =
        replaceLineBreaks: false
        android: {} # => doesn't use default app
          # intent: 'INTENT' # Uses default sms app

      # Callbacks, resolves/rejects Promise
      onSuccess = -> return resolve()
      onError = (e) -> return reject()

      # Sends SMS
      sms.send(number, message, options, onSuccess, onError)
      return true

  # # # # #

  # TODO - should return a Promise, rename to ensurePermission()
  # TODO - should be added to service
  checkSMSPermission: ->

    success = (hasPermission) =>
      if hasPermission
        console.log 'HAS SMS PERMISSION!'
        @sendSms()
      else
        # show a helpful message to explain why you need to require the permission to send a SMS
        # read http://developer.android.com/training/permissions/requesting.html#explain for more best practices
      return

    error = (e) ->
      alert('Something went wrong:' + e)
      return

    sms.hasPermission(success, error)

# # # # #

module.exports = new SMSService()
