
class ContactMethodForm extends Marionette.LayoutView
  className: 'row'

  template: =>
    switch @options.type
      when 'email' then return require './templates/email_form'
      when 'phone' then return require './templates/phone_form'
      when 'address' then return require './templates/address_form'
      when 'social' then return require './templates/social_form'

  behaviors:
    ModelEvents: {}
    SubmitButton: {}

  onSubmit: (e) ->
    attrs = Backbone.Syphon.serialize(@)
    @model.save(attrs)

  onRequest: ->
    console.log 'ON REQUEST'

  onError: ->
    console.log 'ON ERROR'

  onSync: ->
    console.log 'ON SYNC'

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
