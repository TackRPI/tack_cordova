
# ShareModel class definition
# This model provides a restful interface
# used to add a new contact via Tack username
class ShareModel extends Backbone.Model
  urlRoot: '/share'

# ShareService class definition
# Basic Marionette.Service class that acts as a ShareModel factory
class ShareService extends Marionette.Service

  radioRequests:
    'share model': 'model'

  model: ->
    return new Promise (resolve, reject) =>
      return resolve new ShareModel()

# # # # #

module.exports = new ShareService()
