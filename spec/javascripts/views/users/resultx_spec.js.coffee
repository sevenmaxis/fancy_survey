describe 'FancySurvey.Views.User.Result', ->
  model = null
  timer_view = null
  result = null

  beforeEach ->
    loadFixtures 'user_result_view.html'
    
  describe "rendering", ->
    it "renders image", ->
      image_link = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRStwH3maKRqLU8lLOo1XbO6uZIKHRyf2PGv66H6ol5mB0kS_0r"
      model = new FancySurvey.Models.User
      timer_view = new FancySurvey.Views.User.Timer(model: model)
      expect($('#image').width()).toEqual 0
      model.set('image', image_link)
      result = new FancySurvey.Views.User.Result(model: model, timer: timer_view)
      result.render()
      spyOn(result.model, 'fetch').andReturn false
      expect($('#image').width()).toBeGreaterThan 0
