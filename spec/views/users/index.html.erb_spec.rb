require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :first_name => "First Name",
        :second_name => "Second Name",
        :email => "Email",
        :shoe_size => 1,
        :ice_cream => "Ice Cream",
        :superhero => "Superhero",
        :movie_star => "Movie Star",
        :super_bowl_winner => "Super Bowl Winner"
      ),
      stub_model(User,
        :first_name => "First Name",
        :second_name => "Second Name",
        :email => "Email",
        :shoe_size => 1,
        :ice_cream => "Ice Cream",
        :superhero => "Superhero",
        :movie_star => "Movie Star",
        :super_bowl_winner => "Super Bowl Winner"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Second Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Ice Cream".to_s, :count => 2
    assert_select "tr>td", :text => "Superhero".to_s, :count => 2
    assert_select "tr>td", :text => "Movie Star".to_s, :count => 2
    assert_select "tr>td", :text => "Super Bowl Winner".to_s, :count => 2
  end
end
