require "rails_helper"

describe "a user logs into account" do
  context "as an admin, user visits the category index page" do
    it "is able to add a new category to the index" do
      admin = User.create(username: "BowserAdmin", password: "test", role: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_categories_path
      click_on "New category"
      expect(current_path).to eq(new_admin_category_path)
      fill_in "category[title]", with: "Things dogs like to eat"
      click_on "Create Category"

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Things dogs like to eat")

      end
    end

    context "as a default user" do
      it "the user is not able to access the categories page" do
        user = User.create(username: "Tad Friend", password: "test")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit admin_categories_path
        expect(page).to have_content("The page you were looking for doesn't exist.")
      end
    end

  end
