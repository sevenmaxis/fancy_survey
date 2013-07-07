describe 'FancySurvey.Views.User.Timer', ->
  timer = null
  ticks = null

  beforeEach ->
    jasmine.Clock.useMock();
    ticks = 1000
    model = new FancySurvey.Models.User
    timer = new FancySurvey.Views.User.Timer(model: model)

  it 'ticks the time', ->
    time = timer.time
    jasmine.Clock.tick(ticks)
    expect(timer.time).toBeLessThan(time)

  it "#expired", ->
    expect(timer.expired()).toBe false
    jasmine.Clock.tick(100*ticks)
    expect(timer.expired()).toBe true