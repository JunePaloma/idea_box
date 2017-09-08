FactoryGirl.define do
  factory :user do
    sequence :username do |n|
     "Bowser#{n}"
    end
    password "test"

  end
end
