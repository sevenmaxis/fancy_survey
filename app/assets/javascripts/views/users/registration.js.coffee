class FancySurvey.Views.User.Registration extends Backbone.View
  el: '#main'
  template: JST['templates/users/registration']

  events:
    'click .save': 'save'

  initialize: (options) ->
    @timer = options.timer

  save: ->
    if @timer.expired()
      @model.save {},
        error: (model, response) ->
          console.log response.responseText

  render: ->
    @$el.html @template
    @



    
