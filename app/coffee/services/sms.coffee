
# SMS Service sends texts on behalf of Tack
# Used to send a ShareProfile to a new contact that has been
# added manually in the application
# Leverages the Cordova SMS plugin - https://github.com/cordova-sms/cordova-sms-plugin
class SMSService extends Marionette.Service

  radioRequests:
    'sms send': 'send'

  # Sends text & message
  send: (number, message) ->
    return new Promise (resolve, reject) =>

      # Options
      options =
        replaceLineBreaks: false
        android: {}

      # Callbacks, resolves/rejects Promise
      onSuccess = -> return resolve()
      onError = (e) -> return reject()

      # Sends SMS
      sms.send(number, message, options, onSuccess, onError)
      return true

  # Ensures that the application has
  # the approved permissions to send text messages
  ensurePermission: ->
    return new Promise (resolve, reject) =>

    # Callbacks
    onSuccess = (hasPermission) =>
      return resolve() if hasPermission
      return reject()

    onError = (e) -> return reject(e)

    # Checks permissions
    sms.hasPermission(onSuccess, onError)
    return true

# # # # #

module.exports = new SMSService()
