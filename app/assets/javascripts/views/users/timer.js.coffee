class FancySurvey.Views.User.Timer extends Backbone.View
  el: '#timer'
  #templeate: HandlbarsTemplate['users/timer']

  initialize: ->
    @time = @model.startTime()
    @timer = setInterval(@tick.bind(@), 1000)

  tick: ->
    result = if (@time -= 1) > 0 then @time else "EXPIRED"
    $(".timer").text(result)

  expired: ->
    if @time > 0 then false else true