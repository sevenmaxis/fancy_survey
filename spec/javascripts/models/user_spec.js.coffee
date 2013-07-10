describe 'FancySurvey.Models.User', ->

  beforeEach ->
    @user = new FancySurvey.Models.User

  describe '#initialize', ->
    it 'instantiates new User object', ->
      expect(@user).toBeDefined()

  describe '#startTime', ->
    it "returns start time", ->
      currentTime = Math.round(new Date().getTime()/1000)
      expect(@user.startTime()).toEqual currentTime

  describe '#timeRemains', ->
    it "changes time", ->
      user_time = @user.timeRemains()

      time = new Date().getTime() + 4000
      spyOn(window, "Date").andReturn {getTime: -> time}
      
      expect(@user.timeRemains()).toBeLessThan(user_time)

    it "returns expired when time's up", ->
      time = new Date().getTime() + 400000
      spyOn(window, "Date").andReturn {getTime: -> time}
      
      expect(@user.timeRemains()).toEqual 'EXPIRED'


