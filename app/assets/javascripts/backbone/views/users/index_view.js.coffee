MDM.Views.Users ||= {}

class MDM.Views.Users.IndexView extends Backbone.View
  template: JST["backbone/templates/users/index"]

  initialize: () ->
    @options.users.bind('reset', @addAll, this);

  addAll: () =>
    @options.users.each(@addOne)

  addOne: (users) =>
    view = new MDM.Views.Users.UsersView({model : users})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(users: @options.users.toJSON() ))
    @addAll()

    return this


