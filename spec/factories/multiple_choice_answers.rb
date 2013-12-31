# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :multiple_choice_answer do
    multiple_choice_question nil
    case_answer nil
  end
end
