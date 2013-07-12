class FancySurvey.Views.User.Base extends Backbone.View
  el: '#main'

  initialize: ->
    setInterval(@tick.bind(@), 1000)

  tick: ->
    $('#timer h1').text @model.timeRemains()

  events:
    'click .save': 'save'

  save: ->
    if @model.timeRemains() > 0
      @model.save {},
        error: (model, response) ->
          console.log response.responseText

