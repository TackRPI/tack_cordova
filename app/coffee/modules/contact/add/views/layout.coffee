# TODO - should be part of Contact Service?
class ContactAdder extends Backbone.Model
  urlRoot: '/add_contact'

  defaults:
    email: 'ranjit@gmail.com'
    # username: ''

# # # # #

class ContactAddView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

# # # # #

module.exports = ContactAddView
