Service = require './service'
ListRoute = require './list/route'
ShowRoute = require './show/route'

# # # # #

class ShareProfileRouter extends Backbone.Routing.Router

  routes:
    'share_profiles(/)':          'list'
    'share_profiles/:id(/)':      'show'

  list: ->
    new ListRoute({ container: window.Container })

  show: (id) ->
    new ShowRoute({ container: window.Container, id: id })

# # # # #

module.exports = new ShareProfileRouter()
