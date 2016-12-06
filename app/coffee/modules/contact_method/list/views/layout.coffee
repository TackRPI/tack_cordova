ContactMethodListView = require './contactMethodList'

# # # # #

# ContactListLayout class definition
# Wrapper view for the ContactMethodListView
class ContactListLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  regions:
    listRegion: '[data-region=list]'

  onShow: ->
    @listRegion.show new ContactMethodListView({ collection: @collection })

# # # # #

module.exports = ContactListLayout
