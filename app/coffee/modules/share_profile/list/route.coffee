LayoutView  = require './views/layout'

# # # # #

# ShareProfileListRoute class definition
class ShareProfileListRoute extends require '../../base/route'

  fetch: ->
    return Backbone.Radio.channel('share_profile').request('collection')
    .then (collection) => @collection = collection

  render: (id) ->
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = ShareProfileListRoute
