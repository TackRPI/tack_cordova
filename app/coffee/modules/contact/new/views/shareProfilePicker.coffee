
class ShareProfileChild extends Marionette.LayoutView
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

class ShareProfileList extends Marionette.CollectionView
  childView: ShareProfileChild
  className: 'list-group'
  tagName: 'ul'

# # # # #

module.exports = ShareProfileList
