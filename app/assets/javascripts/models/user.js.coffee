class FancySurvey.Models.User extends Backbone.Model
  url: '/users'

  schema:
    first_name: "Text"
    second_name: "Text"
    birthday: "Date"
    show_size: "Text"
    ice_cream: "Text"
    superhero: "Text"
    movie_star: "Text"
    world_end: "Date"
    super_bowl_winner: "Text"
    url: "Text"

  initialize: ->
    @fs = 'fancy_survey'
    window.name = @fs
    $.cookie(@fs, @currentTime())

  timeRemains: ->
    time = 360 - @currentTime() + @startTime()
    if time > 0 then time else 'EXPIRED'

  currentTime: ->
    Math.round(new Date().getTime()/1000)

  startTime: ->
    parseInt($.cookie(@fs))




