
class ContactMethodChild extends Marionette.LayoutView
  template: require './templates/contact_method_child'
  className: 'list-group-item'
  tagName: 'a'

  attributes: ->
    return { href: '#contact_methods/' + @model.id }

  serializeData: ->
    data = super
    console.log data
    data

class ContactMethodListView extends Marionette.CollectionView
  template: require './templates/layout'
  className: 'list-group'
  tagName: 'ul'
  childView: ContactMethodChild
  # TODO - emptyView

# # # # #

module.exports = ContactMethodListView
