class FancySurvey.Models.User extends Backbone.Model
  url: '/users'

  initialize: ->
    @fs = 'fancy_survey'
    unless window.name == @fs
      window.name = @fs
      $.cookie @fs, @currentTime()

  timeRemains: ->
    time = 360 - @currentTime() + @startTime()
    if time > 0 then time else 'EXPIRED'

  currentTime: ->
    Math.round(new Date().getTime()/1000)

  startTime: ->
    parseInt $.cookie(@fs)




