MDM.Views.Users ||= {}

class MDM.Views.Users.IndexView extends Backbone.View
  template: JST["backbone/templates/users/index"]

  initialize: () ->
    @options.users.bind('reset', @addAll)

  addAll: () =>
    @options.users.each(@addOne)

  addOne: (users) =>
    view = new MDM.Views.Users.UsersView({model : users})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(users: @options.users.toJSON() ))
    @addAll()

    return this

# class UserListView extends Backbon.View
#   template: JST["backbone/templates/users/index"]

#   el: ('#users-table')

#   initialize: () ->
#     @userList = new MDM.Collections.UsersCollection();
#     @userList.bind('reset', this.addAll, this);
#     @userList.bind('all', this.render, this);
#     @userList.fetch slicent: true, success: (collection, response) ->
#       if response inst null
#         collection.reset(response.user);
#       else userListView.render();

#   render: =>
#     @$el.html()

#   addAll: =>
#     @userList.each(@addOne)

#   addOne: =>
#     view = new UsersView({model : users})
#     @$("tbody").append(view.render().el)

# userListView = new userListView();
