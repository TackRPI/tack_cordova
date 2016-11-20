
_sendFlash = (type, obj) ->
  Backbone.Radio.channel('flash').trigger(type, obj)

# # # # #

class FlashesBehavior extends Marionette.Behavior

  initialize: (options={}) ->
    @view._flashes      = @options
    @view.flashError    = @flashError
    @view.flashSuccess  = @flashSuccess

  flashError: (obj={}) ->
    _sendFlash('error', @_flashes['error'] || obj)

  flashSuccess: (obj={}) ->
    _sendFlash('success', @_flashes['success'] || obj)

# # # # #

module.exports = FlashesBehavior
