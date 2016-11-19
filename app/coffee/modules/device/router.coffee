Service = require './service'
ListRoute = require './list/route'
ShowRoute = require './show/route'

# # # # #

class DeviceRouter extends require '../base/router'

  routes:
    'devices(/)':          'list'
    'devices/:id(/)':      'show'

  list: ->
    plugins?.deviceFeedback.haptic()
    plugins?.deviceFeedback.acoustic()
    new ListRoute({ container: @container })

  show: (id) ->
    plugins?.deviceFeedback.haptic()
    plugins?.deviceFeedback.acoustic()
    new ShowRoute({ container: @container, id: id })

# # # # #

module.exports = new DeviceRouter({ container: window.Layout.mainRegion })
