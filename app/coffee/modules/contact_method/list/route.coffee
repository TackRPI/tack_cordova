LayoutView  = require './views/layout'

# # # # #

# ContactMethodListRoute class definition
class ContactMethodListRoute extends require '../../base/route'

  fetch: ->
    return Backbone.Radio.channel('contact_method').request('collection')
    .then (methods) => @collection = methods

  render: (id) ->
    @container.show new LayoutView({ collection: @collection })

# # # # #

module.exports = ContactMethodListRoute
