MDM.Views.Devices ||= {}

class MDM.Views.Devices.DeviceView extends Backbone.View
  template: JST["backbone/templates/devices/device"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
