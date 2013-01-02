MDM.Views.Devices ||= {}

class MDM.Views.Devices.EditView extends Backbone.View
  template : JST["backbone/templates/devices/edit"]

  events :
    "submit #edit-device" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (device) =>
        @model = device
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
