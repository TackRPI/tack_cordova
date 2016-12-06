
# ContactMethodEmpty class definition
# Defines a Marionette.LayoutView to display a message if no
# ContactMethod model instances are found
class ContactMethodEmpty extends Marionette.LayoutView
  template: require './templates/contact_method_empty'
  className: 'list-group-item list-group-item-warning'
  tagName: 'li'

# ContactMethodChild class definition
# Defines a Marionette.LayoutView to display a ContactMethod model instance
class ContactMethodChild extends Marionette.LayoutView
  template: require './templates/contact_method_child'
  className: 'list-group-item'
  tagName: 'a'

  attributes: ->
    return { href: '#contact_methods/' + @model.id }

# ContactMethodListView class definition
# Defines a Marionette.CollectionView to display the list of ContactMethod instances
class ContactMethodListView extends Marionette.CollectionView
  template: require './templates/layout'
  className: 'list-group'
  tagName: 'ul'
  childView: ContactMethodChild
  emptyView: ContactMethodEmpty

# # # # #

module.exports = ContactMethodListView
