
# Application layout
class LayoutView extends Marionette.LayoutView
  el: 'body'

  regions:
    header: '[data-region=header]'
    main: '[data-region=main]'

# Exports instance
layout = new LayoutView()
module.exports = layout
