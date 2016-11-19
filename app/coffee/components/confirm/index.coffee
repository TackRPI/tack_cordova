ConfirmView = require './views/confirmView'

# # # # #

class ConfirmComponent extends require '../modal/abstract'

  radioRequests:
    'confirm show': 'confirm'

  confirm: (options={}) ->
    return new Promise (resolve, reject) =>
      confirmView = new ConfirmView(options)

      # Hide on deny / confirm
      confirmView.on 'denied',    => @hideModal()
      confirmView.on 'confirmed', => @hideModal()

      # Shows view in modal
      # Accepts 'small' / 'large' for size option
      @showModal(confirmView, { size: options.size })

      # Returns confirmView
      resolve(confirmView)

# # # # #

module.exports = new ConfirmComponent({ container: window.Layout.modal })
