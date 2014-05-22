# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer_vote do
    voter nil
    answer nil
  end
end
