class FancySurvey.Routers.User extends Backbone.Router
  routes:
    "": "registration"
    "survey": "survey"
    "result": "result"

  initialize: ->
    @user = new FancySurvey.Models.User
    timer = new FancySurvey.Views.User.Timer(model: @user)
    $("#timer").html(timer.render().el)
    @options = { model: @user, timer: timer }

  registration: ->
    view = new FancySurvey.Views.User.Registration(@options)
    $("#main").html(view.render().el)
    view # for test purpose

  survey: ->
    view = new FancySurvey.Views.User.Survey(@options)
    $('#main').html(view.render().el)
    view # for test purpose

  result: ->
    view = new FancySurvey.Views.User.Result(@options)
    $('#main').html(view.render().el)
    view # for test purpose
