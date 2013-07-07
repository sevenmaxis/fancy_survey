class FancySurvey.Routers.User extends Backbone.Router
  routes:
    "": "registration"
    "survey": "survey"
    "result": "result"

  initialize: ->
    @user = new FancySurvey.Models.User
    #@timer_view = FancySurvey.Views.

  registration: ->
    view = FancySurvey.Views.User.Registration(model: @user)
    $("#main").html(view.render().el)
    view # for test purpose

  survey: ->
    view = FancySurvey.Views.User.Survey(model: @user)
    $('#main').html(view.render().el)
    view # for test purpose

  result: ->
    view = FancySurvey.Views.User.Result(model: @user)
    $('#main').html(view.render().el)
    view # for test purpose
