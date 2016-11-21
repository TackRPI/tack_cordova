
# BindInputs class definition
# Extends BindBase behavior - updates model with attributes
# when input field's contents change
class BindInputs extends require './bindBase'

  events:
    'input input':  'updateAttrs'

# # # # #

module.exports = BindInputs
