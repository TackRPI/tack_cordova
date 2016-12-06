
# ShareProfilePickerChild class definition
# Defines a Marionette.LayoutView to display a ShareProfile model instance
# in the ShareProfilePicker view
class ShareProfilePickerChild extends Marionette.LayoutView
  template: require './templates/share_profile_child'
  className: 'list-group-item'
  tagName: 'li'

  events:
    'click': 'onClick'

  onClick: (e) ->

    # Deselect
    if @$el.hasClass('active')
      @trigger('deselected')
      @$el.removeClass('active')
      return

    # Select
    @trigger('selected')
    @$el.addClass('active').siblings().removeClass('active')

# # # # #

# ShareProfilePickerList class definition
# Defines a Marionette.CollectionView to list available ShareProfile instances
# than can be selected by the user
class ShareProfilePickerList extends Marionette.CollectionView
  childView: ShareProfilePickerChild
  className: 'list-group'
  tagName: 'ul'

# # # # #

module.exports = ShareProfilePickerList
