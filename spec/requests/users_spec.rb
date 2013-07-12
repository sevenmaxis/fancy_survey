require 'spec_helper'

describe "Users", vcr: {cassette_name: "User#requests"} do
  
  describe "#registration" do
    it "should have submit button" do
      visit "/"
      page.should have_css('.save')
    end

    it "require all fields", js: true do
      fill_in 'first_name', with: "Vasia"
      fill_in 'second_name', with: "Michael"
      select '2001/11/11', from: 'BIRTH DATE'
      click_button 'Save'
      page.current_path.should_not == "..."
      page.should have_content('some error')
    end

    it "redirects to next page", js: true do
      fill_in 'first_name', with: "Vasia"
      fill_in 'second_name', with: "Michael"
      fill_in 'email', with: "test@test.com"
      select '2001/11/11', from: 'BIRTH DATE'
      fill_in 'shoe_size', with: "54"
      page.current_path.should == "survey"
    end
  end

  describe '#survey' do
    it "should have submit button" do
      page.should have_css('imput[name="commit"')
    end

    it "require all fields", js: true do
      fill_in 'ice_cream', with: "plombir"
      fill_in 'superhero', with: "sosed"
      #fill_in 'movie_star', with: "iam"
      select '2001/11/11', from: 'WHEN DO YOU THINK THE WORLD WILL END?'
      click_button 'Save'
      page.current_path.should == "be the same"
      page.shoudl have_content('some error')
    end

    it "redirect to next page", js: true do
      fill_in 'ice_cream', with: "plombir"
      fill_in 'superhero', with: "sosed"
      fill_in 'movie_star', with: "iam"
      select '2001/11/11', from: 'WHEN DO YOU THINK THE WORLD WILL END?'
      click_button 'Save'
      page.current_path == 'result'
    end
  end

  describe "#result" do
    it "" do
      str = "CONGRATULATIONS, YOU DID IT! HERE'S YOUR AWESOME PRIZE:"
      page.should have_content(str)

    end
  end
end
