FactoryGirl.define do
  factory :course do
    sequence(:name){|n| "course#{n}"}
  end
end
