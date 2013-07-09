describe 'FancySurvey.Models.User', ->

  beforeEach ->
    @fs = 'fancy_survey'
    window.name = ''
    document.cookie['fancy_survey'] = ''
    @user = new FancySurvey.Models.User

  describe '#initialize', ->
    it 'instantiates new User object', ->
      expect(@user).toBeDefined()

  describe '#startTime', ->
    it 'returns default start time', ->
      expect(@user.startTime()).toEqual 360

    it 'returns current time', ->
      window.name = @fs
      document.cookie['fancy_survey'] = 40
      $.cookie(@fs, 40)
      expect(@user.startTime()).toEqual 39

  describe '#setTime', ->
    it "sets time", ->
      @user.setTime(100)
      expect($.cookie(@fs)).toEqual '100'

