
# ModelEventsBehavior class definition
# Creates standard model event listeners and
# defines associated callbacks on the view to which
# the behavior is attached.
class ModelEventsBehavior extends Marionette.Behavior

  # Standard Backbone.Model REST events
  modelEvents:
    'request':  'onModelRequest'
    'sync':     'onModelSync'
    'error':    'onModelError'

  onModelRequest: (model, status, options) ->
    @view.onRequest?(model, status, options)

  onModelSync: (model, response, options) ->
    @view.onSync?(model, response, options)

  onModelError: (model, response, options) ->
    @view.onError?(model, response, options)

# # # # #

module.exports = ModelEventsBehavior
