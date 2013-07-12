class FancySurvey.Views.User.Survey extends FancySurvey.Views.User.Base
  template: JST['users/survey']

  render: ->
    form = new Backbone.Form(
      model: @model
      schema:
        ice_cream: "Text"
        superhero: "Text"
        movie_star: "Text"
        world_end: "Date"
        super_bowl_winner: "Text"
    ).render()
    @$el.html @template user: @model
    $('#form').html form.el
    @