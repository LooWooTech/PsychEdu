FactoryGirl.define do
  factory :learning_period do
    course_learning
    start_on{ Date.today }
    end_on{ start_on + 29.days }
  end
end
