window.FancySurvey =
  Models: {}
  Collections: {}
  Views: {User:{}}
  Routers: {}
  init: ->
    window.router = new FancySurvey.Routers.User

$(document).ready ->
  FancySurvey.init()
  
