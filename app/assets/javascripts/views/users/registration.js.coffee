class FancySurvey.Views.User.Registration extends FancySurvey.Views.User.Base
  template: JST['users/registration']

  initialize: ->
    @model.clearId()
    super()

  save: ->
    console.log "registration"
    super('survey', 'birthday')

  render: ->
    @form = new Backbone.Form(
      model: @model
      schema:
        first_name: 
          validators: ['required']
        second_name:
          validators: ['required']
        email: 
          validators: ["required", "email"]
        birthday: "Date"
        shoe_size:
          validators: ['required']
    ).render()
    @$el.html @template user: @model
    $('#form').html @form.el
    @

