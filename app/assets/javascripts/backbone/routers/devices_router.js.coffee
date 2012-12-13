class MDM.Routers.DevicesRouter extends Backbone.Router
  initialize: (options) ->
    @devices = new MDM.Collections.DevicesCollection()
    @devices.reset options.devices

  routes:
    "devices/new"      : "newDevice"
    "devices/index"    : "index"
    "devices/:id/edit" : "edit"
    "devices/:id"      : "show"
    "devices/.*"       : "index"

  newDevice: ->
    @view = new MDM.Views.Devices.NewView(collection: @devices)
    $("#rightSide #main").html(@view.render().el)

  index: ->
    @view = new MDM.Views.Devices.IndexView(devices: @devices)
    $("#rightSide #main").html(@view.render().el)

  show: (id) ->
    device = @devices.get(id)

    @view = new MDM.Views.Devices.ShowView(model: device)
    $("#rightSide #main").html(@view.render().el)

  edit: (id) ->
    device = @devices.get(id)

    @view = new MDM.Views.Devices.EditView(model: device)
    $("#rightSide #main").html(@view.render().el)
