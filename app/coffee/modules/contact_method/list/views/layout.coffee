
class ContactChild extends Marionette.LayoutView
  template: require './templates/contact_method_child'
  className: 'list-group-item'
  tagName: 'a'

  attributes: ->
    return { href: '#contact_methods/' + @model.id }

  serializeData: ->
    data = super
    console.log data
    data

class ContactListView extends Marionette.CollectionView
  template: require './templates/layout'
  className: 'list-group'
  tagName: 'ul'
  childView: ContactChild
  # TODO - emptyView

# # # # #

class ContactListLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  regions:
    listRegion: '[data-region=list]'

  onShow: ->
    @listRegion.show new ContactListView({ collection: @collection })

# # # # #

module.exports = ContactListLayout
