
class UpdateChild extends Marionette.LayoutView
  template: require './templates/child'
  className: 'list-group-item'
  tagName: 'li'

class UpdateEmpty extends Marionette.LayoutView
  template: require './templates/empty'
  className: 'list-group-item list-group-item-warning'
  tagName: 'li'

class UpdateList extends Marionette.CollectionView
  className:  'list-group'
  tagName:    'ul'
  childView:  UpdateChild
  emptyView:  UpdateEmpty

# # # # #

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
