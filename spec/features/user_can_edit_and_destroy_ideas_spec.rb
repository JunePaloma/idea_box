require "rails_helper"

describe "a user logs into their account" do
  context "and is able to edit an idea" do
    it "sees the changes made after edit" do
        user = User.create(username: "BowserAdmin", password: "test")
        idea = create(:idea, user_id: user.id)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_idea_path(user, idea)
        click_on "Edit"
        expect(current_path).to eq edit_user_idea_path(user, idea)
        fill_in "idea[title]", with: "barking"
        fill_in "idea[description]", with: "expressing thoughts vocally"
        click_on "Update Idea"
        expect(page).to have_content("barking")
    end
  end

  context "is able to delete an idea" do
    it "clicks delete and sees an index without that idea" do
      user = User.create(username: "BowserAdmin", password: "test")
      idea = create(:idea, user_id: user.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_idea_path(user, idea)
      click_on "Delete"
      expect(current_path).to eq user_ideas_path(user)
    end
  end
end
