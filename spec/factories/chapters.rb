# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chapter do
    sequence(:name){|n| "name#{n}"}
    course
  end
end
