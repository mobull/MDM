MDM.Views.Users ||= {}

class MDM.Views.Users.EditView extends Backbone.View
  template: JST["backbone/templates/users/edit"]

  events:
    "submit #edit-users": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (users) =>
        @model = users
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
