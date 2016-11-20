LayoutView  = require './views/layout'

# # # # #

class ContactMethodNewRoute extends require '../../base/route'

  initialize: (options) ->
    console.log 'ADJKASHDJKASH>'
    console.log @options
    console.log options
  fetch: ->
    console.log 'FETCHING?'
    # return Backbone.Radio.channel('contact_method').request('model')
    # .then (model) => @model = model

  render: ->
    console.log @model
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = ContactMethodNewRoute
