FactoryGirl.define do
  factory :course do
    subject
    sequence(:name){|n| "course#{n}"}
  end
end
