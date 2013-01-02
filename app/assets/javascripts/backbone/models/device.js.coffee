class MDM.Models.Device extends Backbone.Model
  paramRoot: 'device'

  urlRoot : '/api/v1/devices'

  defaults:
    'name': null
    'user_id': null

class MDM.Collections.DevicesCollection extends Backbone.Collection
  model: MDM.Models.Device
  url: '/api/v1/devices'
