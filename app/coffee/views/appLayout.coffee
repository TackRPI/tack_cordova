
# Application layout
class LayoutView extends Marionette.LayoutView
  el: 'body'

  template: false

  regions:
    header: '[data-region=header]'
    main:
      selector: '[data-region=main]'
      regionClass: require './animatedRegion'
      inAnimation: 'fadeInUp'
      outAnimation: 'fadeOutDown'

# Exports instance
layout = new LayoutView().render()
module.exports = layout
