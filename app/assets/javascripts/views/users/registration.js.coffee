class FancySurvey.Views.User.Registration extends FancySurvey.Views.User.Base
  template: JST['users/registration']

  render: ->
    form = new Backbone.Form(
      model: @model
      schema:
        first_name: "Text"
        second_name: "Text"
        email: "Text"
        birthday: "Date"
        show_size: "Text"
    ).render()
    @$el.html @template user: @model
    $('#form').html form.el
    @    

