LogoutView  = require './views/layout'

# # # # #

# LogoutRoute class definition
class LogoutRoute extends require '../../base/route'

  render: (id) ->
    @container.show new LogoutView()

# # # # #

module.exports = LogoutRoute
