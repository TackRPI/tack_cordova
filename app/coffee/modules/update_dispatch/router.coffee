Service = require './service'
ListRoute = require './list/route'

# # # # #

class UpdateDispatchRouter extends require '../base/router'

  routes:
    'update_dispatches(/)': 'list'

  list: ->
    new ListRoute({ container: @container })

# # # # #

module.exports = new UpdateDispatchRouter({ container: window.Layout.mainRegion })
