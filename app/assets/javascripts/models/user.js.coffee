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

  startTime: ->
    if window.name != @fs
      window.name = @fs
      360
    else
      parseInt($.cookie(@fs)) - 1 # suppose we loose 1 second on refreshing

  setTime: (time) ->
    $.cookie(@fs, time)




