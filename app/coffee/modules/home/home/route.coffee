LayoutView  = require './views/layout'

# # # # #

# HomeRoute class definition
class HomeRoute extends require '../../base/route'

  render: ->
    @container.show new LayoutView()

# # # # #

module.exports = HomeRoute
