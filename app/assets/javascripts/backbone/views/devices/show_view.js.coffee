MDM.Views.Devices ||= {}

class MDM.Views.Devices.ShowView extends Backbone.View
  template: JST["backbone/templates/devices/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
