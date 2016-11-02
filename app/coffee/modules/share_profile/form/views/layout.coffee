
# # # # #
# TODO - abstract picker into a separate file

class ContactMethodPickerChild extends Marionette.LayoutView
  template: require './templates/contact_method_child'
  className: 'list-group-item'
  tagName: 'li'

  events:
    'change input[type=checkbox]': 'onCheckboxChange'

  # onRender: ->
  #   console.log @options.selected

  onCheckboxChange: (e) ->
    selected = @$(e.currentTarget).prop('checked')
    @trigger 'selected', selected
    @updateCss(selected)

  updateCss: (selected) ->
    return @$el.addClass('active') if selected
    @$el.removeClass('active')

# # # # #

class ContactMethodPicker extends Marionette.CollectionView
  className: 'list-group'
  childView: ContactMethodPickerChild

  childViewOptions: ->
    return { selected: @model.get('contact_method_ids') }

# # # # #

# # # # #

class ShareProfileForm extends Marionette.LayoutView
  template: require './templates/layout'
  className: 'row'

  behaviors:
    ModelEvents: {}
    SubmitButton: {}

  regions:
    contactMethodsRegion: '[data-region=contact_methods]'

  serializeData: ->
    return { items: @collection.toJSON() }

  onRender: ->
    Backbone.Syphon.deserialize( @, @model.attributes )

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
    console.log attrs
    # @model.save(attrs)

  onRequest: ->
    console.log 'ON REQUEST'

  onError: ->
    console.log 'ON ERROR'

  onSync: ->
    console.log 'ON SYNC'

# # # # #

module.exports = ShareProfileForm
