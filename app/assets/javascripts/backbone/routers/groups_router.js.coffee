class MDM.Routers.GroupsRouter extends Backbone.Router
  initialize: (options) ->
    @groups = new MDM.Collections.GroupsCollection()
    @groups.reset options.groups

  routes:
    "new"      : "newGroup"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newGroup: ->
    @view = new MDM.Views.Groups.NewView(collection: @groups)
    $("#groups").html(@view.render().el)

  index: ->
    @view = new MDM.Views.Groups.IndexView(groups: @groups)
    $("#groups").html(@view.render().el)

  show: (id) ->
    group = @groups.get(id)

    @view = new MDM.Views.Groups.ShowView(model: group)
    $("#groups").html(@view.render().el)

  edit: (id) ->
    group = @groups.get(id)

    @view = new MDM.Views.Groups.EditView(model: group)
    $("#groups").html(@view.render().el)
