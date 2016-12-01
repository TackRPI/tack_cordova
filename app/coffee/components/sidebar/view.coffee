
# SidebarView class definition
# The SidebarView renders the app's sidebar with
# the menuItems specified below
class SidebarView extends Marionette.LayoutView
  template: require './template'
  className: 'nav nav-pills nav-stacked'
  tagName: 'nav'

  menuItems: [
    # { href: '#contacts',          icon: 'fa-user-circle-o', title: 'Contacts', divider: true }
    { href: '#contact_methods',   icon: 'fa-address-card',  title: 'Contact Methods' }
    { href: '#share_profiles',    icon: 'fa-list',          title: 'Share Profiles', divider: true }
    { href: '#update_dispatches', icon: 'fa-refresh',       title: 'Update Dispatches', divider: true }
    { href: '#contacts/new',      icon: 'fa-plus',          title: 'Manual' }
    { href: '#share/add',         icon: 'fa-plus',          title: 'By Username', divider: true }
    { href: '#auth/logout',       icon: 'fa-sign-out',      title: 'Log Out', divider: true }
  ]

  events:
    'click a': 'onClicked'

  onClicked: ->
    Backbone.Radio.channel('sidebar').trigger('hide')

  serializeData: ->
    return { items: @menuItems }

# # # # #

module.exports = SidebarView
