
# AbstractDecorator class definition
# TODO - document
class BaseDecorator

  # Decoration method
  # Invoked in Marionette.View.prototype.serializeModel
  @decorate: (model) ->

    # Clones model's attributes
    # Cloning prevents contamination of
    data = _.clone(model.attributes)

    # Iterates over each function in prototype
    # Leverages Underscore.js _.functions()

    # TODO - expand _.functions into a
    # separate and independently scoped function
    # this should be part of the documentation and process
    for func in _.functions(@prototype)

      # Skip constructor
      continue if func == 'constructor'

      # Assigns value of function to hash
      data[func] = @prototype[func].apply(model)

    # Returns the model's attributes & decorations
    return data

# # # # #

module.exports = BaseDecorator
