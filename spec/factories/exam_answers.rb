# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exam_answer do
    exam_question nil
    parent nil
  end
end
