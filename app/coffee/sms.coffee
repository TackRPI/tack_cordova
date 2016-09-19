
class SMSWorker

  constructor: ->
    console.log 'sms worker constructor'
    @initialize()

  initialize: ->
    console.log 'smsworker initialize'
    return

  # # # # #

  sendSms: (number='5162876345', message='Hello from cordova')->
    # number = document.getElementById('numberTxt').value
    # message = document.getElementById('messageTxt').value

    console.log 'SEND SMS'
    console.log 'number=' + number + ', message= ' + message

    #CONFIGURATION
    options =
      replaceLineBreaks: false
      android: # {} => doesn't use default app
        intent: 'INTENT' # Uses default sms app

    success = ->
      alert 'Message sent successfully'
      return

    error = (e) ->
      alert 'Message Failed:' + e
      return

    sms.send number, message, options, success, error
    return

  # # # # #

  # TODO - should return a Promise, rename to ensurePermission()
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

module.exports = new SMSWorker()
