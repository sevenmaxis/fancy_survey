class FancySurvey.Views.User.Base extends Backbone.View
  el: '#main'

  initialize: ->
    setInterval(@tick.bind(@), 1000)

  tick: ->
    console.log($('#timer h1').text())
    $('#timer h1').text @model.timeRemains()

  events:
    'click .save': 'save'

  render: ->
    @$el.html @template user: @model
    @    
