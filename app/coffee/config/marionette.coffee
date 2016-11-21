# Marionette.Behaviors configuration
Marionette.Behaviors.behaviorsLookup = -> require '../behaviors'

# Overrides default serializeModel() method definition
# In the context the serializeModel method, 'this'
# refers to the view instance inside which the
# serializeModel method was invoked
Marionette.View.prototype.serializeModel = ->

  # If this.model is not defined, return an empty object
  if !this.model
    return {}

  # If this.model exists, and has a decorator defined,
  # return the this.model's attributes and decorations
  else if this.model.decorator
    return this.model.decorator.decorate(this.model)

  # Otherwise, return the cloned attributes of this.model
  return _.clone this.model.attributes
