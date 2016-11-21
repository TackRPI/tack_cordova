ContactMethodListView = require './contactMethodList'

# # # # #

class ContactListLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  regions:
    listRegion: '[data-region=list]'

  onShow: ->
    @listRegion.show new ContactMethodListView({ collection: @collection })

# # # # #

module.exports = ContactListLayout
