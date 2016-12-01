
# BaseDecorator class definition
# Defines a simple class to decorate models when
# they are serialized into a view's template
class BaseDecorator

  # Decoration method
  # Invoked in Marionette.View.prototype.serializeModel
  @decorate: (model) ->

    # Clones model's attributes
    # Cloning prevents contamination of
    data = _.clone(model.attributes)

    # Iterates over each function in prototype
    # Leverages Underscore.js _.functions()
    for func in _.functions(@prototype)

      # Skip constructor
      continue if func == 'constructor'

      # Assigns value of function to hash
      data[func] = @prototype[func].apply(model)

    # Returns the model's attributes & decorations
    return data

# # # # #

module.exports = BaseDecorator
