describe 'FancySurvey.Views.User.Registration', ->

  beforeEach ->
    loadFixtures 'user_view.html'
    model = new FancySurvey.Models.User
    @registration = new FancySurvey.Views.User.Registration(model: model)
    @registration.render()
    @registration.tick() # to force render timer

  describe "rendering", ->
    it 'fills with 5 fields', ->
      expect($('.field').length).toEqual 5

    it 'ticks the time', ->
      runs ->
        @time = parseInt($('#timer h1').text())
      waits(1000)
      runs ->
        expect(@time).toBeGreaterThan(parseInt($('#timer h1').text()))

  describe "#save", ->

    it "triggers event", ->
      spyOn(@registration, 'save')
      @registration.delegateEvents()
      $('.save').click()
      expect(@registration.save).toHaveBeenCalled()

    it "saves model if not expired", ->
      spyOn(@registration.model, 'timeRemains').andReturn(100)
      spyOn(@registration.model, 'save')
      $('.save').click()
      expect(@registration.model.save).toHaveBeenCalled()

    it "not save model if expired", ->
      spyOn(@registration.model, 'timeRemains').andReturn('EXPIRED')
      spyOn(@registration.model, 'save')
      $('.save').click()
      expect(@registration.model.save).not.toHaveBeenCalled()

