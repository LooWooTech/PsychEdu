FactoryGirl.define do
  factory :unit do
    chapter
    sequence(:name){|n| "name#{n}"}
  end
end
