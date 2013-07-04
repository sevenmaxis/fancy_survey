require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :first_name => "MyString",
      :second_name => "MyString",
      :email => "MyString",
      :shoe_size => 1,
      :ice_cream => "MyString",
      :superhero => "MyString",
      :movie_star => "MyString",
      :super_bowl_winner => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_first_name[name=?]", "user[first_name]"
      assert_select "input#user_second_name[name=?]", "user[second_name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_shoe_size[name=?]", "user[shoe_size]"
      assert_select "input#user_ice_cream[name=?]", "user[ice_cream]"
      assert_select "input#user_superhero[name=?]", "user[superhero]"
      assert_select "input#user_movie_star[name=?]", "user[movie_star]"
      assert_select "input#user_super_bowl_winner[name=?]", "user[super_bowl_winner]"
    end
  end
end
