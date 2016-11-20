Service = require './service'
ListRoute = require './list/route'
NewRoute = require './new/route'
ShowRoute = require './show/route'
EditRoute = require './edit/route'

# # # # #

class ShareProfileRouter extends require '../base/router'

  routes:
    'share_profiles(/)':          'list'
    'share_profiles/new(/)':      'new'
    'share_profiles/:id(/)':      'show'
    'share_profiles/:id/edit(/)': 'edit'

  list: ->
    new ListRoute({ container: @container })

  new: ->
    new NewRoute({ container: @container })

  show: (id) ->
    new ShowRoute({ container: @container, id: id })

  edit: (id) ->
    new EditRoute({ container: @container, id: id })

# # # # #

module.exports = new ShareProfileRouter({ container: window.Layout.mainRegion })
