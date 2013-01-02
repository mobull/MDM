class MDM.Models.Users extends Backbone.Model
  paramRoot: 'user'

  defaults:
  	'name': '(Untitled User)'
  	'email': null

class MDM.Collections.UsersCollection extends Backbone.Collection
  model: MDM.Models.Users
  url: '/api/v1/users'
