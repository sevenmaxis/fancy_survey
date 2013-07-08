describe 'FancySurvey.Views.User.Registration', ->
  registration = null

  beforeEach ->
    loadFixtures 'user_registration_view.html'
    model = new FancySurvey.Models.User
    timer_view = new FancySurvey.Views.User.Timer(model: model)
    registration = new FancySurvey.Views.User.Registration({ model: model, timer: timer_view })

  describe "rendering", ->
    it 'fills with 5 fields', ->
      expect($('.field').length).toEqual 5

  describe "#save", ->

    it "triggers event", ->
      spyOn(registration, 'save')
      registration.delegateEvents();
      $('.save').click()
      expect(registration.save).toHaveBeenCalled()

    it "saves model if not expired", ->
      spyOn(registration.timer, 'expired').andReturn(false)
      spyOn(registration.model, 'save')
      $('.save').click()
      expect(registration.model.save).toHaveBeenCalled()

    it "not save model if expired", ->
      spyOn(registration.timer, 'expired').andReturn(true)
      spyOn(registration.model, 'save')
      $('.save').click()
      expect(registration.model.save).not.toHaveBeenCalled()

