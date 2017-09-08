require "rails_helper"

RSpec.describe "a user visits the welcome page" do
  describe "enters their credentials" do
    it "clicks log in and sees their ideas index page" do

        create (:user)
        visit '/'

       click_on "Log into your account"

       expect(current_path).to eq(login_path)

       fill_in "session[username]", with: "Bowser"
       fill_in "session[password]", with: "test"

       click_on "Log in"

       expect(page).to have_content("Hello Bowser!")
     end

    describe "enters an invalid username" do
      it " is directed back to the log in page" do
            create (:user)
            visit '/'
            click_on "Log into your account"
            expect(current_path).to eq(login_path)
            fill_in "session[username]", with: "BowWow"
             fill_in "session[password]", with: "test"
             click_on "Log in"
             expect(current_path).to eq(login_path)
  end
end

  it "user enters invalid password" do
    create (:user)
    visit '/'
    click_on "Log into your account"
    expect(current_path).to eq(login_path)
    fill_in "session[username]", with: "Bowser"
     fill_in "session[password]", with: "MilkBone"
     click_on "Log in"
     expect(current_path).to eq(login_path)
   end
  end
end
