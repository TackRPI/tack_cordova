
# TODO - document
# We attach the @container property to the router, gets passed to all child routes
class BaseRoute extends Backbone.Routing.Route

  initialize: (options) -> @container = options.container

# # # # #

module.exports = BaseRoute
