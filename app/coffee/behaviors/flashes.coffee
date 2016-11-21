
# TODO - document
_sendFlash = (type, obj) ->
  Backbone.Radio.channel('flash').trigger(type, obj)

# # # # #

# TODO - document
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
