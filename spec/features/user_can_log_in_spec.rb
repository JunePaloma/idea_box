require "rails_helper"

RSpec.describe "a user visits the welcome page" do
  describe "enters their credentials" do
    it "clicks log in and sees their ideas index page" do

      visit '/'

       click_on "Log into your account"

       expect(current_path).to eq(login_path)

       fill_in "session[username]", with: "Bowser"
       fill_in "session[password]", with: "test"

       click_on "Log in"

       expect(page).to have_content("Hi Bowser!")


    end
  end
end
