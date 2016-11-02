ShareProfileForm = require '../../form/views/layout'

# # # # #

class NewShareProfileLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  regions:
    formRegion: '[data-region=form]'

  onRender: ->
    @formRegion.show new ShareProfileForm({ model: @model })

# # # # #

module.exports = NewShareProfileLayout
