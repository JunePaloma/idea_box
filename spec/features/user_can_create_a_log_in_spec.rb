require 'rails_helper'

RSpec.describe "A guest visits the root " do
    context "and sees a link to create a new user" do
    context "clicking on that link brings the visitor to the New user page" do
      it "fills out a form and is able to create a user profile" do

        visit "/"
        expect(page).to have_link("Create New User")
        click_on "Create New User"
        expect(current_path).to eq(new_user_path)

        fill_in "user[username]", with: "Bowser"
        fill_in "user[password]", with: "woof"

        click_on "Create User"

        expect(current_path).to eq(user_path(User.last))
        expect(page).to have_content ("Hello Bowser!")
      end
    end
  end
end
