
class ContactMethodEmpty extends Marionette.LayoutView
  template: require './templates/contact_method_empty'
  className: 'list-group-item list-group-item-warning'
  tagName: 'li'

# # # # #

class ContactMethodChild extends Marionette.LayoutView
  template: require './templates/contact_method_child'
  className: 'list-group-item'
  tagName: 'a'

  attributes: ->
    return { href: '#contact_methods/' + @model.id }

# # # # #

class ContactMethodListView extends Marionette.CollectionView
  template: require './templates/layout'
  className: 'list-group'
  tagName: 'ul'
  childView: ContactMethodChild
  emptyView: ContactMethodEmpty

# # # # #

module.exports = ContactMethodListView
