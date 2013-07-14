class FancySurvey.Views.User.Result extends FancySurvey.Views.User.Base
  template: JST['users/result']

  initialize: ->
  	Backbone.history.navigate("registration", true) if @model.isNew()

  render: ->
    @model.fetch success: =>
	  	# to get image url from server
    	$("#image").attr "src", @model.get("image_url")
    	console.log "image_url: " + @model.get("image_url")
    @$el.html @template user: @model
    @