describe 'FancySurvey.Views.User.Result', ->

  beforeEach ->
    loadFixtures 'user_view.html'
    
  describe "rendering", ->
    it "renders image", ->
      image_link = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRStwH3maKRqLU8lLOo1XbO6uZIKHRyf2PGv66H6ol5mB0kS_0r"
      model = new FancySurvey.Models.User
      model.set('image', image_link)
      result = new FancySurvey.Views.User.Result(model: model)
      spyOn(result.model, 'fetch').andReturn false
      result.render()
      expect($('#image').width()).toEqual 275
