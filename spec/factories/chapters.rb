FactoryGirl.define do
  factory :chapter do
    topic
    sequence(:name){|n| "chapter#{n}"}
  end
end
