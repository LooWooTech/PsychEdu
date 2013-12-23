FactoryGirl.define do
  factory :unit do
    sequence(:name){|n| "name#{n}"}
  end
end
