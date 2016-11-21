
class UpdateDispatchListLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  events:
    'click [data-click=sync]': 'startSync'

  startSync: ->
    Backbone.Radio.channel('update_dispatch').request('sync')

# # # # #

module.exports = UpdateDispatchListLayout
