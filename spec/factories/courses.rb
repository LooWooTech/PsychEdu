FactoryGirl.define do
  factory :course do
    topic
    sequence(:name){|n| "course#{n}"}
  end
end
