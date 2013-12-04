FactoryGirl.define do
  factory :leaving_period do
    learning_period
    start_on{ learning_period.start_on + 10.days }
    end_on{ start_on + 60.days }
  end
end
