class MDM.Views.UsersIndex extends Backbone.View

  template: JST['users/index']
  
  events:
  	"click .new": "new"
  	"click .destory": "destory"
  	"click .show": "show"

  tagName: "form"

  initialize: ->
  	@model.bind 'change', @render

  new: ->
    @model.new()
    @create()

  destory: ->
    @model.destory()
    @remove()

  show: ->
    @model.show()
    @show