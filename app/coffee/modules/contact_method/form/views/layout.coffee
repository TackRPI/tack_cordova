
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

  onRender: ->
    Backbone.Syphon.deserialize( @, @model.attributes )

  onSubmit: (e) ->
    attrs = Backbone.Syphon.serialize(@)
    @model.save(attrs)

  onRequest: ->
    console.log 'ON REQUEST'

  onError: ->
    console.log 'ON ERROR'

  onSync: ->
    console.log 'ON SYNC'
    window.location = '#contact_methods'

# # # # #

module.exports = ContactMethodForm
