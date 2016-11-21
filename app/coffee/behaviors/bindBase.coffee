
# BaseBind class definition
# A base behavior that provides updateAttrs method used by bindInputs behavior
class BindBase extends Marionette.Behavior

  updateAttrs: (e) ->
    e.stopPropagation()
    @view.model.set(Backbone.Syphon.serialize(@))

# # # # #

module.exports = BindBase
