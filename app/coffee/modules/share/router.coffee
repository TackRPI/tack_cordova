require './service'
AddRoute  = require './add/route'

# # # # #

# ShareRouter class definition
class ShareRouter extends require '../base/router'

  routes:
    'share/add(/)': 'add'

  add: ->
    new AddRoute({ container: @container })

# # # # #

module.exports = new ShareRouter({ container: window.Layout.mainRegion })
