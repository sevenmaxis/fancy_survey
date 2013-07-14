class FancySurvey.Views.User.Base extends Backbone.View
  el: '#main'

  initialize: ->
    setInterval(@tick.bind(@), 1000)

  tick: ->
    $('#timer h1').text @model.timeRemains()

  events:
    'click .save': 'save'

  save: (path, field)->
    if @model.timeRemains() > 0 and not @form.commit()
      #@model.restoreId()
      console.log @
      console.log "saving model #{@model.id}"
      @convert_date(field)
      @model.save {},
        error: (model, response) =>
          @set_errors(response.responseText)
        success: (data) =>
          @model.persistId() # persists the id of model in the refresh page case
          Backbone.history.navigate(path, true)

  set_errors: (errors)->
    console.log errors
    errors = eval("("+errors+")")
    for field, msg of errors
      @form.fields[field].setError(msg)

  convert_date: (field)->
    date = @model.get field
    date = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()
    @model.set field, date    




