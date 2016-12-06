
# # # # #

# ContactMethodPickerChild class definition
# Defines a Marionette.LayoutView to display ContactMethod class instances
# than can be selected
class ContactMethodPickerChild extends Marionette.LayoutView
  template: require './templates/contact_method_child'
  tagName: 'li'

  events:
    'change input[type=checkbox]': 'onCheckboxChange'

  isSelected: ->
    return _.contains(@options.selected, @model.id)

  className: ->
    css = 'list-group-item'
    css += ' active' if @isSelected()
    return css

  templateHelpers: ->
    { checked: @isSelected() }

  onCheckboxChange: (e) ->
    selected = @$(e.currentTarget).prop('checked')
    @trigger 'selected', selected
    @updateCss(selected)

  updateCss: (selected) ->
    return @$el.addClass('active') if selected
    @$el.removeClass('active')

# # # # #

# ContactMethodPicker class definition
# Defines a Marionette.CollectionView to display a list of available
# ContactMethod class instances
class ContactMethodPicker extends Marionette.CollectionView
  className: 'list-group'
  childView: ContactMethodPickerChild

  childViewOptions: ->
    return { selected: @model.get('contact_method_ids') }

# # # # #

# ShareProfileForm class definition
# Defines a Marionette.LayoutView to create and edie
# ShareProfile class instances
class ShareProfileForm extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'row'

  behaviors:
    ModelEvents: {}
    SubmitButton: {}

    Flashes:
      success:
        message:  'Share Profile saved.'
      error:
        message:  'Error saving Share Profile.'

  regions:
    contactMethodsRegion: '[data-region=contact_methods]'

  serializeData: ->
    return { items: @collection.toJSON() }

  onRender: ->
    Backbone.Syphon.deserialize( @, @model.attributes )
    @$('select').val(@model.get('contact_method_ids'))

    # Constructs new contact method picker
    contactMethodPicker = new ContactMethodPicker({ model: @model, collection: @collection })

    # Handles checkbox events
    contactMethodPicker.on 'childview:selected', (view, selected) =>
      ids = @$('select').val() || []

      if selected
        ids.push view.model.id
      else
        ids = _.without(ids, view.model.id)

      @$('select').val(ids) # TODO - use @ui

    # Shows view
    @contactMethodsRegion.show(contactMethodPicker)

  onSubmit: (e) ->
    attrs = Backbone.Syphon.serialize(@)
    @model.save(attrs)

  onRequest: ->
    @disableSubmit()

  onError: ->
    @flashError()
    @enableSubmit()

  onSync: ->
    @flashSuccess()
    Backbone.Radio.channel('app').trigger('redirect', '#share_profiles')

# # # # #

module.exports = ShareProfileForm
