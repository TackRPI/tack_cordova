ShareProfileForm = require '../../form/views/layout'

# # # # #

# NewShareProfileLayout class definition
# Defines a wrapper view for ShareProfileForm
class NewShareProfileLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  regions:
    formRegion: '[data-region=form]'

  onRender: ->
    @formRegion.show new ShareProfileForm({ model: @model, collection: @collection })

# # # # #

module.exports = NewShareProfileLayout
