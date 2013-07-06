describe "routers/Users", ->

  it "should be defined", ->
    expect(FancySurvey.Routers.User).toBeDefined()

  it "can be instantiated", ->
    router = new FancySurvey.Routers.User()
    expect(router).not.toBeNull()

  describe "initialize", ->
    beforeEach ->
      @router = new FancySurvey.Router.User()

    it "should create a user", ->
      expect(@router.user).toBeDefined()

  describe "routes", ->
    beforeEach ->
      @router = new FancySurvey.Routers.User()
      Backbone.history.start()

    afterEach ->
      Backbone.history.stop()

    it 'should be defined', ->
      expect(@router.routers).toBeDefined()

    it 'should have correct routes', ->
      expect(@router.routes['']).toBeDefined()
      expect(@router.routes['survey']).toBeDefined()
      expect(@router.routes['result']).toBeDefined()

    it 'should not have other routes', ->
      expect(@router.routes['xxxxx']).not.toBeDefined()

  describe "actions", ->
    beforeEach ->
      @router = new FancySurvey.Routers.User()
      Backbone.history.start()

    afterEach ->
      Backbone.history.stop()

    it "should have used actions defined", ->
      expect(@router.registration).toBeDefined()
      epxect(@router.survey).toBeDefined()
      expect(@router.result).toBeDefined()

    describe "registration", ->
      it "should create the user view", ->
        view = @router.registration()
        expect(view instanceof FancySurvey.Views.User.Registration).toBeTruthy()

    describe "survey", ->
      it "should create the user view", ->
        view = @router.survey()
        expect(view instanceof FancySurvey.Views.User.Survey).toBeTruthy()

    describe "result", ->
      it "should create the user view", ->
        view = @router.result()
        expect(view instanceof FancySurvey.Views.User.Result).toBeTruthy()
