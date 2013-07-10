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
      time = @user.timeRemains()

      @_Date = Date
      testContext = @
      time = new Date().getTime() + 400
      spyOn(window, "Date").andCallFake ->
        new testContext._Date(time)
      
      expect(@user.timeRemains()).toBeLessThan(time)

    it "returns expired when time's up", ->
      @_Date = Date
      testContext = @
      time = new Date().getTime() + 400000
      spyOn(window, "Date").andCallFake ->
        new testContext._Date(time)
      
      expect(@user.timeRemains()).toEqual 'EXPIRED'


