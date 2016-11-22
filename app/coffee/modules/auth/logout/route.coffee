LogoutView  = require './views/layout'

# # # # #

class LogoutRoute extends require '../../base/route'

  render: (id) ->
    @container.show new LogoutView()

# # # # #

module.exports = LogoutRoute
