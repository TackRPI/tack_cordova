
class ContactAddView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  behaviors:
    SubmitButton: {}

  onSubmit: (e) ->
    attrs = Backbone.Syphon.serialize(@)
    # TODO - native contact service
    # Backbone.channel('native:contact').request('add', attrs)

# # # # #

module.exports = ContactAddView
