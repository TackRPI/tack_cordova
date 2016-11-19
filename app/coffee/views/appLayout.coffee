
# Application layout
class LayoutView extends Marionette.LayoutView
  el: 'body'

  template: false

  regions:
    header: '[data-region=header]'

    modal:
      selector:     '[data-region=modal]'
      regionClass:  require './modalRegion'

    main:
      selector: '[data-region=main]'
      regionClass: require './animatedRegion'
      inAnimation: 'fadeInUp'
      outAnimation: 'fadeOutDown'

# # # # #

# Exports instance
module.exports = new LayoutView().render()
