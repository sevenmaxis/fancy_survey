class FancySurvey.Views.User.Result extends FancySurvey.Views.User.Base
  template: JST['users/result']

  render: ->
    @model.fetch() # to get image url from server
    @$el.html @template user: @model
    $("#image").attr "src", @model.get("image_url")
    @
