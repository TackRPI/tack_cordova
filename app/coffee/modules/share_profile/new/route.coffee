LayoutView  = require './views/layout'

# # # # #

class NewShareProfileRoute extends Backbone.Routing.Route

  initialize: (options={}) ->
    @container = options.container

  fetch: ->
    return Promise.all([
      Backbone.Radio.channel('share_profile').request('model'),
      Backbone.Radio.channel('contact_method').request('collection')
    ])
    .then (values) =>
      @model      = values[0]
      @collection = values[1]

  render: ->
    @container.show new LayoutView({ model: @model, collection: @collection })

# # # # #

module.exports = NewShareProfileRoute
