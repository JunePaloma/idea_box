require "rails_helper"

describe "a user has successfully logged in" do
describe "in the show page for a user" do
  describe "the user clicks logout" do
    it "is able to log out" do

      default_user = create (:user)
      visit '/'
      click_on "Log into your account"
      fill_in "session[username]", with: "Bowser"
      fill_in "session[password]", with: "test"
      click_on "Log in"

      visit user_path(default_user)
      click_on "Log out"
      expect(current_path).to eq(root)

      end
    end
  end
end
