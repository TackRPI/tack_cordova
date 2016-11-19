
# TODO - document
# We attach the @container property to the router, gets passed to all child routes
class BaseRouter extends Backbone.Routing.Router

  initialize: (options) -> @container = options.container

# # # # #

module.exports = BaseRouter
