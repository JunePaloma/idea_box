require "rails_helper"

describe "a user logs into account" do
  context "and visits the show page for an idea" do
  it "is able to add an image to the idea" do

    user = User.create(username: "Bowser", password: "test")
    idea = create(:idea, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_idea_path(user, idea)
    click_on "Choose image"

    end
  end
end
