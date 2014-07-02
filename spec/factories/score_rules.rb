# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score_rule do
    topic_testing nil
    name "MyString"
    score 1.5
    description "MyText"
  end
end
