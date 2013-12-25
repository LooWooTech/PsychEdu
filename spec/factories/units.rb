FactoryGirl.define do
  factory :unit do
    course
    sequence(:name){|n| "name#{n}"}
  end
end
