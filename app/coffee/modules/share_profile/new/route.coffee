LayoutView  = require './views/layout'

# # # # #

# NewShareProfileRoute class definition
class NewShareProfileRoute extends require '../../base'

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
