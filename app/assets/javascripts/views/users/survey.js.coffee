class FancySurvey.Views.User.Survey extends Backbone.View
  el: '#main'
  template: JST['templates/users/survey']

  events:
    'click .save': 'save'

  initialize: (options) ->
    @timer = options.timer

  save: ->
    if not @timer.expired()
      @model.save {},
        error: (model, response) ->
          console.log response.responseText

  render: ->
    @$el.html @template
    @
