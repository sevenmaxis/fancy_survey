class FancySurvey.Views.User.Survey extends FancySurvey.Views.User.Base
  template: JST['users/survey']

  save: ->
    console.log "survey"
    super('result', 'world_end')

  render: ->
    @form = new Backbone.Form(
      model: @model
      schema:
        ice_cream:
          validators: ['required']
        superhero:
          validators: ['required']
        movie_star:
          validators: ['required']
        world_end: "Date"
        super_bowl_winner:
          validators: ['required']
    ).render()
    @$el.html @template user: @model
    $('#form').html @form.el
    @