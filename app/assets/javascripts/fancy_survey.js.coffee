window.FancySurvey =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    window.router = new FancySurvey.Routers.User

$(document).ready ->
  FancySurvey.init()
  
