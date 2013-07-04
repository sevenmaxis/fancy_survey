require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :first_name => "First Name",
      :second_name => "Second Name",
      :email => "Email",
      :shoe_size => 1,
      :ice_cream => "Ice Cream",
      :superhero => "Superhero",
      :movie_star => "Movie Star",
      :super_bowl_winner => "Super Bowl Winner"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Second Name/)
    rendered.should match(/Email/)
    rendered.should match(/1/)
    rendered.should match(/Ice Cream/)
    rendered.should match(/Superhero/)
    rendered.should match(/Movie Star/)
    rendered.should match(/Super Bowl Winner/)
  end
end
