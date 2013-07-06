describe 'FancySurvey.Models.User', ->
  user = null

  beforeEach ->
    window.name = ''
    user = new FancySurvey.Models.User

  describe '#initialize', ->
    it 'instantiates new User object', ->
      expect(user).toBeDefined()

  describe '#startTime', ->
    it 'returns default start time', ->
      expect(user.startTime()).toEqual 360

    it 'returns current time', ->
      window.name = 'fancy_survey'
      document.cookie = 40
      expect(user.startTime()).toEqual 39

  describe '#setTime', ->
    it "sets time", ->
      user.setTime(100)
      expect(document.cookie).toEqual '100'

