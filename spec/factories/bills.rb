FactoryGirl.define do
  factory :bill do
    from_id 1
    to_id 2
    amount 1.5
    paid false
  end
end
