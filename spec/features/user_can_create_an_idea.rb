require "rails_helper"

describe "a user logs into account" do
  context "clicks a button to create a new idea" do
    context " fills out a form for a new idea" do
      it "sees the show page for new idea" do

        user = (:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit user_ideas_path
        click_on "New idea"

        expect(current_path).to eq(new_user_idea_path)

        fill_in "idea[title]", with:"Awesome idea"
        fill_in "idea[description]", with: "Super Duper"
        select "top tier", from: "category"

        click_on "Create idea"

        expect(current_path).to eq(user_ideas_path(user, Idea.last))
        expect(page).to have_content
