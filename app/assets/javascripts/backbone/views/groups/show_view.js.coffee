MDM.Views.Groups ||= {}

class MDM.Views.Groups.ShowView extends Backbone.View
  template: JST["backbone/templates/groups/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
