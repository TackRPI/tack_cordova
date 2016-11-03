ContactMethodForm = require '../../form/views/layout'

# # # # #

class EditContactMethodLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  regions:
    formRegion: '[data-region=form]'

  onRender: ->
    @formRegion.show new ContactMethodForm({ model: @model, type: @model.get('type') })

# # # # #

module.exports = EditContactMethodLayout
