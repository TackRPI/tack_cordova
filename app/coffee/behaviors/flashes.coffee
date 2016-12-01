
# Helper method to send data to FlashComponent
_sendFlash = (type, obj) ->
  Backbone.Radio.channel('flash').trigger(type, obj)

# # # # #

# FlashesBehavior class definition
# Provides an easy-to-implement FlashComponent
# interface for views to create
# success and error Flashes (two most common use cases)
class FlashesBehavior extends Marionette.Behavior

  initialize: (options={}) ->
    @view._flashes      = @options
    @view.flashError    = @flashError
    @view.flashSuccess  = @flashSuccess

  flashError: (obj=null) ->
    _sendFlash('error', obj || @_flashes['error'])

  flashSuccess: (obj=null) ->
    _sendFlash('success', obj || @_flashes['success'])

# # # # #

module.exports = FlashesBehavior
