window.FancySurvey =
  Models: {}
  Collections: {}
  Views: {User: {}}
  Routers: {}
  init: ->
    window.router = new FancySurvey.Routers.User
    Backbone.history.start()

$(document).ready ->
  $.ajaxSetup cache: false
  FancySurvey.init()
  
