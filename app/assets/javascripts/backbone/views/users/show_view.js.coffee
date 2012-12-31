MDM.Views.Users ||= {}

class MDM.Views.Users.ShowView extends Backbone.View
  template: JST["backbone/templates/users/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
