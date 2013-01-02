class MDM.Routers.DevicesRouter extends Backbone.Router
  initialize: (options) ->
    @devices = new MDM.Collections.DevicesCollection
    if options? and options.devices?
      @devices.reset options.devices
    else
      @devices.fetch()

  routes:
    "devices/new"      : "newDevice"
    "devices/index"    : "index"
    "devices/:id/edit" : "edit"
    "devices/:id"      : "show"
    "devices"          : "index"

  newDevice: ->
    @view = new MDM.Views.Devices.NewView(collection: @devices)
    $('#container').prepend(@view.render().el)

  index: ->
    @view = new MDM.Views.Devices.IndexView(devices: @devices)
    $('#container').prepend(@view.render().el)

  show: (id) ->
    device = @devices.get(id)

    @view = new MDM.Views.Devices.ShowView(model: device)
    $('#container').prepend(@view.render().el)

  edit: (id) ->
    device = @devices.get(id)

    @view = new MDM.Views.Devices.EditView(model: device)
    $('#container').prepend(@view.render().el)
