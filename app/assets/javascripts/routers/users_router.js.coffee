class FancySurvey.Routers.User extends Backbone.Router
  routes:
    "": "registration"
    "survey": "survey"
    "result": "result"

  initialize: ->
    @user = new FancySurvey.Models.User

  registration: ->
    view = new FancySurvey.Views.User.Registration(model: @user)
    view.render
    view # for test purpose

  survey: ->
    view = new FancySurvey.Views.User.Survey(model: @user)
    view.render
    view # for test purpose

  result: ->
    view = new FancySurvey.Views.User.Result(model: @user)
    view.render
    view # for test purpose
