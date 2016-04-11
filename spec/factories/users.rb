FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    credit 50
  end
end
