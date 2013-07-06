class FancySurvey.Models.User extends Backbone.Model
  url: '/users'

  defaults:
    first_name: 'test'
    second_name: ''
    birthday: ''
    shoe_size: ''
    ice_cream: ''
    superhero: ''
    movie_star: ''
    world_end: ''
    super_bowl_winner: ''

  initialize: ->

  startTime: ->
    fs = 'fancy_survey'
    if window.name != fs
      window.name = fs
      360
    else
      parseInt(document.cookie) - 1 # suppose we loose 1 second on refreshing

  setTime: (time) ->
    document.cookie = time




