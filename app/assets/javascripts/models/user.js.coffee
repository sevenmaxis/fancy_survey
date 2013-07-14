class FancySurvey.Models.User extends Backbone.Model
  urlRoot: '/users'

  initialize: ->
    @fs = 'fancy_survey'
    @_id = 'id'
    if window.name == @fs
      @restoreId()
    else
      window.name = @fs
      @clearId()
      @saveTime()

  timeRemains: ->
    # for debug purpose 360 -> 3600
    time = 360 - @currentTime() + @startTime()
    if time > 0 then time else 'EXPIRED'

  currentTime: ->
    Math.round(new Date().getTime()/1000)

  startTime: ->
    parseInt $.cookie(@fs)

  persistId: ->
    $.cookie @_id, @id

  restoreId: ->
    cookie = $.cookie(@_id)
    @set 'id', parseInt(cookie) if cookie
    console.log cookie if cookie

  clearId: ->
    $.removeCookie @_id

  saveTime: ->
    $.cookie @fs, @currentTime()




