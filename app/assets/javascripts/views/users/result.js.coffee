# class FancySurvey.Views.User.Result extends Backbone.View
#   el: '#main'
#   template: JST['templates/users/result']

#   initialize: (options) ->
#     @timer = options.timer
#     # server should return url to random image
#     @model.fetch()

#   render: ->
#     @$el.html @template
#     $("#image").attr "src", @model.get("image")
#     @
class FancySurvey.Views.User.Result extends FancySurvey.Views.User.Base
  template: JST['templates/users/result']

  render: ->
    @model.fetch()
    @$el.html @template
    @