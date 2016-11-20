
# Provides updateAttrs method used by bindCheckboxes, bindInputs, bindRadios, bindSelects
class BindBase extends Marionette.Behavior

  updateAttrs: (e) ->
    e.stopPropagation()
    @view.model.set(Backbone.Syphon.serialize(@))

# # # # #

module.exports = BindBase
