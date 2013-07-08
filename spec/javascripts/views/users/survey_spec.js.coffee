describe 'FancySurvey.Views.User.Survey', ->
  survey = null

  beforeEach ->
    loadFixtures 'user_survey_view.html'
    model = new FancySurvey.Models.User
    timer_view = new FancySurvey.Views.User.Timer(model: model)
    survey = new FancySurvey.Views.User.Survey({ model: model, timer: timer_view })

  describe 'rendering', ->
    it 'fill with 5 fields', ->
      expect($('.field').length).toEqual 5

  describe '#save', ->

    it "triggers event", ->
      spyOn(survey, 'save')
      survey.delegateEvents()
      $('.save').click()
      expect(survey.save).toHaveBeenCalled()

    it "saves model if not expired", ->
      spyOn(survey.timer, 'expired').andReturn(false)
      spyOn(survey.model, 'save')
      $('.save').click()
      expect(survey.model.save).toHaveBeenCalled()

    it "not save model if exprired", ->
      spyOn(survey.timer, 'expired').andReturn(true)
      spyOn(survey.model, 'save')
      $('.save').click()
      expect(survey.model.save).not.toHaveBeenCalled()