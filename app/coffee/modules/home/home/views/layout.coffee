
class HomeView extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'container-fluid'

  authenticatedItems: [
    'contacts'
    'contact_methods'
    'share_profiles'
    'logout'
    'list'
  ]

  menuItems:
    contacts:         { href: '#contacts', icon: 'fa-user-circle-o', label: 'Contacts' }
    contact_methods:  { href: '#contact_methods', icon: 'fa-address-card', label: 'Contact Methods' }
    share_profiles:   { href: '#share_profiles', icon: 'fa-list', label: 'Share Profiles' }
    sign_in:          { href: '#auth/sign_in', icon: 'fa-sign-in', label: 'Sign In' }
    register:         { href: '#auth/register', icon: 'fa-user-plus', label: 'Register' }
    logout:           { href: '#auth/logout', icon: 'fa-sign-out', label: 'Log Out' }
    list:             { href: '#bluetooth/devices', icon: 'fa-sign-out', label: 'BT DEVICES' }

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


