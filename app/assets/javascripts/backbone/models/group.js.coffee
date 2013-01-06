class MDM.Models.Group extends Backbone.Model
  paramRoot: 'group'

  defaults:

class MDM.Collections.GroupsCollection extends Backbone.Collection
  model: MDM.Models.Group
  url: '/groups'
