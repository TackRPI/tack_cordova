LayoutView  = require './views/layout'

# # # # #

# UpdateDispatchListRoute class definition
class UpdateDispatchListRoute extends require '../../base/route'

  fetch: ->
    return Backbone.Radio.channel('update_dispatch').request('collection')
    .then (collection) => @collection = collection

  render: (id) ->
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = UpdateDispatchListRoute
