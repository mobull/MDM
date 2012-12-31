class MDM.Routers.UsersRouter extends Backbone.Router
  initialize: (options) ->
    @users = new MDM.Collections.UsersCollection()
    @users.reset options.users

  routes:
    "new"      : "newUsers"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newUsers: ->
    @view = new MDM.Views.Users.NewView(collection: @users)
    $("#users").html(@view.render().el)

  index: ->
    @view = new MDM.Views.Users.IndexView(users: @users)
    $("#users").html(@view.render().el)

  show: (id) ->
    users = @users.get(id)

    @view = new MDM.Views.Users.ShowView(model: users)
    $("#users").html(@view.render().el)

  edit: (id) ->
    users = @users.get(id)

    @view = new MDM.Views.Users.EditView(model: users)
    $("#users").html(@view.render().el)