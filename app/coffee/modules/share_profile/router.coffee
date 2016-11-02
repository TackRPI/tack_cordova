Service = require './service'
ListRoute = require './list/route'
NewRoute = require './new/route'
ShowRoute = require './show/route'

# # # # #

class ShareProfileRouter extends Backbone.Routing.Router

  routes:
    'share_profiles(/)':          'list'
    'share_profiles/new(/)':      'new'
    'share_profiles/:id(/)':      'show'
    'share_profiles/:id/edit(/)': 'edit'

  list: ->
    new ListRoute({ container: window.Container })

  new: ->
    new NewRoute({ container: window.Container })

  show: (id) ->
    new ShowRoute({ container: window.Container, id: id })

  edit: (id) ->
    console.log 'EDIT SHARE PROFILE'

# # # # #

module.exports = new ShareProfileRouter()
