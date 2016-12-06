
# HomeView class definition
# Defines a Marionette.LayoutView to render the home page of the application
# Renders different menu items depending on wether or not the end-user has authenticated
class HomeView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  authenticatedItems: [
    'manual'
    'username'
  ]

  menuItems:
    manual:           { href: '#contacts/new', icon: 'fa-plus', label: 'Add by Phone Number' }
    username:         { href: '#share/add', icon: 'fa-plus', label: 'Add by Tack Username' }
    sign_in:          { href: '#auth/sign_in', icon: 'fa-sign-in', label: 'Sign In' }
    register:         { href: '#auth/register', icon: 'fa-user-plus', label: 'Register' }

  serializeData: ->
    authenticated = Backbone.Radio.channel('auth').request('is:authenticated')

    items = {}

    # Authenticated
    if authenticated
      items[i] = @menuItems[i] for i in @authenticatedItems

    # Not authenticated
    else
      for key, val of @menuItems
        items[key] = @menuItems[key] if @authenticatedItems.indexOf(key) == -1

    return { items: items }

# # # # #

module.exports = HomeView


