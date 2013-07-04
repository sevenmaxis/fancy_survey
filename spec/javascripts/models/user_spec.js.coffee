describe 'FancySurvey.Models.User', ->
  user = null

  beforeEach ->
    user = new FancySurvey.Models.User

  describe '#initialize', ->
    it 'instantiates new User object', ->
      expect(user).toBeDefined()

