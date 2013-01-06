MDM.Views.Groups ||= {}

class MDM.Views.Groups.IndexView extends Backbone.View
  template: JST["backbone/templates/groups/index"]

  initialize: () ->
    _.bindAll(this, 'render')
    @options.groups.bind('reset', @addAll)

  addAll: () =>
    @options.groups.each(@addOne)

  addOne: (group) =>
    view = new MDM.Views.Groups.GroupView({model : group})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(groups: @options.groups.toJSON() ))
    @addAll()

    return this
