MDM.Views.Users ||= {}

class MDM.Views.Users.IndexView extends Backbone.View
  template: JST["backbone/templates/users/index"]

  initialize: () ->
    @userIndexView = new UserIndexView();
    @options.users.bind('reset', @addAll, this);
    @options.users.bind('all', @render, this);
    @options.users.fetch slicent: true, success: (collection, response) ->
      if response?
        collection.reset(response.user)
      else userIndexView.render();

  addAll: () =>
    @options.users.each(@addOne)

  addOne: (users) =>
    view = new MDM.Views.Users.UsersView({model : users})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(users: @options.users.toJSON() ))
    @addAll()

    return this


