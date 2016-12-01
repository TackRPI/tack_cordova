
class ShareProfileChild extends Marionette.LayoutView
  template: require './templates/child'
  className: 'list-group-item'
  tagName: 'a'
  attributes: -> return { href: '#share_profiles/' + @model.id }

  # Provides the details string showing which
  # ContactMethods are attached to this ShareProfile
  templateHelpers: ->

    # Capitalize anonymous helper function
    capitalize = (word) -> return word.charAt(0).toUpperCase() + word.slice(1)

    details = ''
    cached = @model.get('cached')
    for key, val of cached
      methods = _.chain(cached[key]).pluck('label').map( (label) => return label + ' ' + capitalize(key) ).value().join(', ')
      details += ', ' if methods && details
      details += "#{methods}" if methods

    return {details: details}

class ShareProfileEmpty extends Marionette.LayoutView
  template: require './templates/empty'
  className: 'list-group-item list-group-item-warning text-center'
  tagName: 'li'

class ShareProfileList extends Marionette.CollectionView
  className:  'list-group'
  tagName:    'ul'
  childView:  ShareProfileChild
  emptyView:  ShareProfileEmpty

# # # # #

class ShareProfileListLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  regions:
    listRegion: '[data-region=list]'

  onRender: ->
    @listRegion.show new ShareProfileList({ collection: @collection })

# # # # #

module.exports = ShareProfileListLayout
