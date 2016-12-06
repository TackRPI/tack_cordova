
# ContactShowLayout class definition
# Defines a basic view for displaying a native contact
class ContactShowLayout extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  serializeData: ->
    data = super
    data.json = JSON.stringify(@model.toJSON(), null, 2).split("\n")
    return data

# # # # #

module.exports = ContactShowLayout
