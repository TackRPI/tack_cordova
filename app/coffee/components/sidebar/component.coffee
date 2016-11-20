
# TODO - break this out into a separate file
# TODO - document
class SidebarView extends Marionette.LayoutView
  template: require './template'
  className: 'nav nav-pills nav-stacked'
  tagName: 'nav'

  menuItems: [
    { href: '#contacts',        icon: 'fa-user-circle-o', title: 'Contacts', divider: true }
    { href: '#contact_methods', icon: 'fa-address-card',  title: 'Contact Methods' }
    { href: '#share_profiles',  icon: 'fa-list',          title: 'Share Profiles', divider: true }
    { href: '#update_dispatches', icon: 'fa-list',          title: 'Update Dispatches', divider: true }
    { href: '#contacts/add_mn', icon: 'fa-bluetooth',          title: 'Bluetooth' }
    { href: '#contacts/add_bt', icon: 'fa-plus',          title: 'Manual', divider: true }
    { href: '#auth/logout',      icon: 'fa-sign-out',      title: 'Log Out', divider: true }
  ]

  events:
    'click a': 'onClicked'

  onClicked: ->
    Backbone.Radio.channel('sidebar').trigger('hide')

  serializeData: ->
    return { items: @menuItems }

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
