MDM.Views.Devices ||= {}

class MDM.Views.Devices.NewView extends Backbone.View
  template: JST["backbone/templates/devices/new"]

  events:
    "submit #new-device": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (device) =>
        @model = device
        window.location.hash = "/#{@model.id}"

      error: (device, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
