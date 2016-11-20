
# TODO - break this out into a separate file
# TODO - document
class SidebarView extends Marionette.LayoutView
  template: require './template'
  className: 'nav nav-pills nav-stacked'
  tagName: 'nav'

  events:
    'click a': 'onClicked'

  onClicked: ->
    Backbone.Radio.channel('sidebar').trigger('hide')

  authenticatedItems: [
    'contacts'
    'contact_methods'
    'share_profiles'
    'logout'
  ]

  menuItems:
    contacts:         { href: '#contacts',        icon: 'fa-user-circle-o', title: 'Contacts' }
    contact_methods:  { href: '#contact_methods', icon: 'fa-address-card',  title: 'Contact Methods' }
    share_profiles:   { href: '#share_profiles',  icon: 'fa-list',          title: 'Share Profiles', divider: true }
    sign_in:          { href: '#auth/sign_in',    icon: 'fa-sign-in',       title: 'Sign In', divider: true }
    register:         { href: '#auth/register',   icon: 'fa-user-plus',     title: 'Register', divider: true }
    logout:          { href: '#auth/logout',      icon: 'fa-sign-out',      title: 'Log Out', divider: true }

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

# TODO - document
class SidebarComponent extends Marionette.Service

  radioEvents:
    'sidebar reset':  'showView'
    'sidebar toggle': 'toggleSidebar'
    'sidebar hide':   'hideSidebar'

  showView: ->
    @view = new SidebarView({ modules: @modules })
    @options.container.show(@view)

  hideSidebar: ->
    return unless @view
    $('body').removeClass('sidebar-active')

  toggleSidebar: ->
    return unless @view
    $('body').toggleClass('sidebar-active')

# # # # #

module.exports = new SidebarComponent({ container: window.Layout.sidebarRegion })
