LayoutView  = require './views/layout'

# # # # #

# RegisterRoute class definition
class RegisterRoute extends require '../../base/route'

  fetch: ->
    @model = Backbone.Radio.channel('auth').request('registrar')

  render: (id) ->
    @container.show new LayoutView({ model: @model })

# # # # #

module.exports = RegisterRoute
