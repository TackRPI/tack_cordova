LayoutView  = require './views/layout'

# # # # #

class EditShareProfileRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: (id) ->
    return Promise.all([
      Backbone.Radio.channel('share_profile').request('model', id),
      Backbone.Radio.channel('contact_method').request('collection')
    ])
    .then (values) =>
      @model      = values[0]
      @collection = values[1]

  render: ->
    @container.show new LayoutView({ model: @model, collection: @collection })

# # # # #

module.exports = EditShareProfileRoute
