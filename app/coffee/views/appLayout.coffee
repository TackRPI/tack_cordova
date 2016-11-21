
# ApplicationLayout class definition
# Defines a Marionette.LayoutView to manage
# top-level application regions
class ApplicationLayout extends Marionette.LayoutView
  el: 'body'

  template: false

  regions:
    headerRegion:   '[data-region=header]'
    flashRegion:    '[data-region=flash]'
    sidebarRegion:  '[data-region=sidebar]'

    modalRegion:
      selector:     '[data-region=modal]'
      regionClass:  require './modalRegion'

    mainRegion:
      selector:     '[data-region=main]'
      regionClass:  require './animatedRegion'
      inAnimation:  'fadeInUp'
      outAnimation: 'fadeOutDown'

# # # # #

# Exports instance
module.exports = new ApplicationLayout().render()
