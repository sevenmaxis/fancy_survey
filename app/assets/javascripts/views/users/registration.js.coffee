class FancySurvey.Views.User.Registration extends FancySurvey.Views.User.Base
  template: JST['users/registration']

  save: ->
    if @model.timeRemains() > 0
      @model.save {},
        error: (model, response) ->
          console.log response.responseText

  render: ->
    @$el.html @template user: @model
    @
