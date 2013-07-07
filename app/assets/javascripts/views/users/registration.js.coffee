class FancySurvey.Views.User.Registration extends Backbone.View
  el: '#main'
  #template: HandlebarsTemplate['users/registration']

  initialize: (timer) ->
    @timer = timer
    @initDatePicker()

  event:
    'click .save': 'save'

  save: ->
    # @model.set
    #   first_name: $("#first_name").val()
    #   second_name: $("#second_name").val()
    #   email: $("#email").val()
    #   region: $(".date-picker").val()
    #   year: $("#year").val()
    #   description: $("#description").val()
    if @timer.expired()
      @model.save {},
        error: (model, response) ->
          console.log response.responseText

  render: ->
    $("#releaseDate" ).datepicker();
    $(@el).html(@template(@model.toJSON()))
    this

  initDatePicker: () ->
    $(".date-picker").datepicker
      language: "en",
      dateFormat: "dd/mm/yy",
      changeYear: true,
      changeMonth: true,
      yearRange: "-75:+5",
      autoclose: true,
      todayHighlight: true



    
