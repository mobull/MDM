class MDM.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
  	'name': null
  	'email': null

class MDM.Collections.UsersCollection extends Backbone.Collection
  model: MDM.Models.User
  url: '/api/v1/users'
