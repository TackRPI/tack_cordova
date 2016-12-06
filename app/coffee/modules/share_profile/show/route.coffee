LayoutView  = require './views/layout'

# # # # #

# ShareProfileShowRoute class definition
class ShareProfileShowRoute extends require '../../base/route'

  fetch: (id) ->
    return Backbone.Radio.channel('share_profile').request('model', id)
    .then (model) => @model = model

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = ShareProfileShowRoute
