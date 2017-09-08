require "rails_helper"

feature "when a user visits the ideas page" do
  context "as a logged in user" do
    it "they can see a list of their ideas" do

      user = create(:user)
      idea = create(:idea, user_id: user.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_ideas_path(user)
      expect(page).to have_content("All your ideas")
      expect(page).to have_content(idea.description)
    end

    it "cannot see another user's ideas" do
      user1, user2 = create_list(:user, 2)
      idea = create(:idea, user_id: user1.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)
      visit user_ideas_path(user1)

      expect(page).to have_content("All your ideas")
      expect(page).not_to have_content(idea.description)

    end

  end

  context "a visitor who has not logged in" do
    it "can't see anything" do
        user = create(:user)
        visit user_ideas_path(user)
        expect(page).not_to have_content("All your ideas")
    end
  end
end
