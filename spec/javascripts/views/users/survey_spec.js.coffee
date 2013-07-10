describe 'FancySurvey.Views.User.Survey', ->

  beforeEach ->
    loadFixtures 'user_view.html'
    model = new FancySurvey.Models.User
    @survey = new FancySurvey.Views.User.Survey(model: model)
    @survey.render()
    @survey.tick() # to force render timer

  describe 'rendering', ->
    it 'fill with 5 fields', ->
      expect($('.field').length).toEqual 5

    it 'ticks the time', ->
      runs ->
        @time = parseInt($('#timer h1').text())
        console.log(@time)
      waits(1000)
      runs ->
        console.log(parseInt($('#timer h1').text()))
        expect(@time).toBeGreaterThan(parseInt($('#timer h1').text()))

  describe '#save', ->

    it "triggers event", ->
      spyOn(@survey, 'save')
      @survey.delegateEvents()
      $('.save').click()
      expect(@survey.save).toHaveBeenCalled()

    it "saves model if not expired", ->
      spyOn(@survey.model, 'timeRemains').andReturn(100)
      spyOn(@survey.model, 'save')
      $('.save').click()
      expect(@survey.model.save).toHaveBeenCalled()

    it "not save model if exprired", ->
      spyOn(@survey.model, 'timeRemains').andReturn('EXPIRED')
      spyOn(@survey.model, 'save')
      $('.save').click()
      expect(@survey.model.save).not.toHaveBeenCalled()