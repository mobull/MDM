class MDM.Models.Users extends Backbone.Model
  paramRoot: 'user'

  defaults:

class MDM.Collections.UsersCollection extends Backbone.Collection
  model: MDM.Models.Users
  url: '/users'
