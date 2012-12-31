class MDM.Models.User extends Backbone.Model
  schema:
    'name': 'Text',
    'password': 'Password',
    'email': {validators: ['required', 'email']}