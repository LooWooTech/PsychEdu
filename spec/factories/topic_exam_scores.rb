# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic_exam_score do
    topic_exam nil
    score_rule nil
    score 1.5
    comment "MyText"
  end
end
