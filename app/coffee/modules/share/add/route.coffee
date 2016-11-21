LayoutView  = require './views/layout'

# # # # #

class AddRoute extends require '../../base/route'

  fetch: ->
    return Promise.all([
      Backbone.Radio.channel('share').request('model')
      Backbone.Radio.channel('share_profile').request('collection')
    ])
    .then (values) =>
      @model      = values[0]
      @collection = values[1]

  render: (id) ->
    @container.show new LayoutView({ model: @model, collection: @collection })

# # # # #

module.exports = AddRoute
