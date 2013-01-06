class MDM.Routers.GroupsRouter extends Backbone.Router
  initialize: (options) ->
    @groups = new MDM.Collections.GroupsCollection()
    # @groups.reset options.groups
    @groups.fetch()

  routes:
    "groups/new"      : "newGroup"
    "groups/index"    : "index"
    "groups/:id/edit" : "edit"
    "groups/:id"      : "show"
    "groups/*"        : "index"

  newGroup: ->
    @view = new MDM.Views.Groups.NewView(collection: @groups)
    $("#container").html(@view.render().el)

  index: ->
    @view = new MDM.Views.Groups.IndexView(groups: @groups)
    $("#container").html(@view.render().el)

  show: (id) ->
    group = @groups.get(id)

    @view = new MDM.Views.Groups.ShowView(model: group)
    $("#container").html(@view.render().el)

  edit: (id) ->
    group = @groups.get(id)

    @view = new MDM.Views.Groups.EditView(model: group)
    $("#container").html(@view.render().el)
