FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    credit 50
  end

  factory :john, class: User do
    name "John Lennon"
    credit 100
  end

  factory :paul, class: User do
    name "Paul McCartney"
    credit 100
  end
end
