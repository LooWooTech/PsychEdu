# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course_learning do
    student
    course
  end
end
