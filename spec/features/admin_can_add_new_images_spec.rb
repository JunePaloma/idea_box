require "rails_helper"

describe "a user logs into account" do
  context "as an admin, user visits the image index" do
    it "is able to add a new image to the index" do

    admin = User.create(username: "BowserAdmin", password: "test", role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_images_path
    click_on "New image"
    expect(current_path).to eq(new_admin_image_path)
    fill_in "image[title]", with: "Steak"
    fill_in "image[address]", with: "http://www.omahasteaks.com/gifs/os/dd_01_filet.jpg"
    click_on "Create Image"
expect(current_path).to eq(admin_images_path)
expect(page).to have_css("img[src*='http://www.omahasteaks.com/gifs/os/dd_01_filet.jpg']")
    end
  end
  describe "a non-admin user logs in" do
  it "cannot add an image" do
    user = User.create(username: "Bowser", password: "test")
    idea = create(:idea, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_admin_image_path
    expect(current_path).not_to eq(admin_images_path)
    expect(page).to have_content("404")
    end
  end
end
