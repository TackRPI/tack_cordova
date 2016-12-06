
# UpdateChild class definition
# Defines a Marionette.LayoutView to display a UpdateDispatch model instance
class UpdateChild extends Marionette.LayoutView
  template: require './templates/child'
  className: 'list-group-item'
  tagName: 'li'

# UpdateEmpty class definition
# Defines a Marionette.LayoutView to display a message if no
# UpdateDispatch model instances are found
class UpdateEmpty extends Marionette.LayoutView
  template: require './templates/empty'
  className: 'list-group-item list-group-item-warning'
  tagName: 'li'

# UpdateList class definition
# Defines a Marionette.CollectionView to display the list of UpdateDispatch instances
class UpdateList extends Marionette.CollectionView
  className:  'list-group'
  tagName:    'ul'
  childView:  UpdateChild
  emptyView:  UpdateEmpty

# # # # #

# UpdateDispatchListLayout class definition
# Defines a Marionette.LayoutView to wrap the UpdateList view
# This view also provides a 'SYNC' button to manually sync UpdateDispatches
class UpdateDispatchListLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  regions:
    listRegion: '[data-region=list]'

  events:
    'click [data-click=sync]': 'startSync'

  onRender: ->
    @listRegion.show new UpdateList({ collection: @collection })

  startSync: ->
    Backbone.Radio.channel('update_dispatch').request('sync')

# # # # #

module.exports = UpdateDispatchListLayout
