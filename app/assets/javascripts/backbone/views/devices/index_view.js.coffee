MDM.Views.Devices ||= {}

class MDM.Views.Devices.IndexView extends Backbone.View
  template: JST["backbone/templates/devices/index"]

  initialize: () ->
    @options.devices.bind('reset', @addAll)

  addAll: () =>
    @options.devices.each(@addOne)

  addOne: (device) =>
    view = new MDM.Views.Devices.DeviceView({model : device})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(devices: @options.devices.toJSON() ))
    @addAll()

    return this
