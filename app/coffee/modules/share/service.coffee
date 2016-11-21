
class ShareModel extends Backbone.Model
  urlRoot: '/share'

# # # # #

class ShareService extends Marionette.Service

  radioRequests:
    'share model': 'model'

  model: ->
    return new Promise (resolve, reject) =>
      return resolve new ShareModel()

# # # # #

module.exports = new ShareService()
