class MDM.Models.Group extends Backbone.Model
  paramRoot: 'group'

  defaults:
  	'groupname': null

class MDM.Collections.GroupsCollection extends Backbone.Collection
  model: MDM.Models.Group
  url: '/api/v1/groups'
