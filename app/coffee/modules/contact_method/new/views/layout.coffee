ContactMethodForm = require '../../form/views/layout'

# # # # #

class NewContactMethodLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  regions:
    formRegion: '[data-region=form]'

  ui:
    typeButton: '[data-click=type]'

  events:
    'click @ui.typeButton': 'changeFormType'

  showForm: (type) ->
    @formRegion.show new ContactMethodForm({ model: @model, type: type })

  changeFormType: (e) ->
    el = @$(e.currentTarget)
    el.addClass('active').siblings('.btn').removeClass('active')
    type = el.data('form')
    @showForm(type)

  onRender: ->
    @showForm('email')

# # # # #

module.exports = NewContactMethodLayout
