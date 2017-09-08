require "rails_helper"

feature "when a user visits the ideas page" do
  context "as a logged in user" do
    it "they can see a list of their ideas" do

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default)

      visit user_ideas_path
      expect(page).to have_content("All your ideas")
    end
  end
end
