
# Window event listener to hide the modal when navigation occurs.
hideModalOnHashChange = ->
  window.modalWindow.hideModal()

# # # # #

# TODO - breakout into separate file
class ModalView extends Marionette.LayoutView

  # QUESTION - aria / accessibility attributes?
  attributes:
    role:     'dialog'
    tabindex: '-1'

  className: 'modal fade'

  # Sets modal size - normal / small / large
  templateHelpers: ->
    size = @options.size || ''
    css = 'modal-dialog'
    css += ' modal-sm' if size == 'small'
    css += ' modal-lg' if size == 'large'
    return { modalCss: css }

  template: require './modal_template'

  regions:
    contentRegion: '[data-region=modal-content]'

  events:
    'show.bs.modal'   : -> @triggerMethod 'show:modal'
    'shown.bs.modal'  : -> @triggerMethod 'shown:modal'
    'hide.bs.modal'   : -> @triggerMethod 'hide:modal'
    'hidden.bs.modal' : -> @triggerMethod 'hidden:modal'
    'loaded.bs.modal' : -> @triggerMethod 'loaded:modal'

  onShow: ->
    @$el.modal( @options.modalOptions || {} )

  hideModal: ->
    @$el.modal('hide')

# # # # #

# Abstract class for modal-based components.
class AbstractModalComponent extends Marionette.Service

  initialize: (options = {}) ->
    @container = options.container

  hideModal: ->
    @modalView.hideModal()

  showModal: (contentView, modalViewOptions={}) ->

      # New Modal View (our view is shown inside this one)
      @modalView = new ModalView(modalViewOptions)

      # Show the view inside the modal wrapper, adds hideModalOnHashChange event listener
      @modalView.on 'show', =>
        @modalView.contentRegion.show( contentView )
        window.addEventListener('hashchange', hideModalOnHashChange)
        window.modalWindow = @modalView

      # Removes hideModalOnHashChange event listener
      @modalView.on 'destroy', ->
        window.removeEventListener('hashchange', hideModalOnHashChange)
        delete window.modalWindow

      # onModalHidden callback
      @modalView.on 'hidden:modal', => @onModalHidden?()

      # Show view in the modal
      @container.show @modalView

# # # # #

module.exports = AbstractModalComponent
