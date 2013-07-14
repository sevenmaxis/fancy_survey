class FancySurvey.Models.User extends Backbone.Model
  urlRoot: '/users'

  initialize: ->
    @fs = 'fancy_survey'
    @id = 'id'
    unless window.name == @fs
      window.name = @fs
      $.cookie @fs, @currentTime()

  timeRemains: ->
    # for debug purpose 360 -> 3600
    time = 3600 - @currentTime() + @startTime()
    if time > 0 then time else 'EXPIRED'

  currentTime: ->
    Math.round(new Date().getTime()/1000)

  startTime: ->
    parseInt $.cookie(@fs)

  setId: (id)->
    $.cookie @id, id

  getId: ->
    $.cookie @id




