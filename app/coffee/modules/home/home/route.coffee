LayoutView  = require './views/layout'

# # # # #

class HomeRoute extends require '../../base/route'

  render: ->
    @container.show new LayoutView()

# # # # #

module.exports = HomeRoute
