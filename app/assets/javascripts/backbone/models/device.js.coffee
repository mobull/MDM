class MDM.Models.Device extends Backbone.Model
  paramRoot: 'device'

  defaults:
    'name': 'Untitled Device'
    'user_id': null

class MDM.Collections.DevicesCollection extends Backbone.Collection
  model: MDM.Models.Device
  url: '/devices'
