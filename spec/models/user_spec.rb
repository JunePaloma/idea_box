require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password)}
  end

it "can be created as an admin" do
  user = create(:user, role: "admin")
  expect(user.role).to eq("admin")
  expect(user.admin?).to be_truthy
  end

  it "can be created as an admin" do
    user = create(:user)
    expect(user.role).to eq("default")
    expect(user.admin?).to be_falsey
  end
end
