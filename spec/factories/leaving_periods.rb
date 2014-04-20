FactoryGirl.define do
  factory :leaving_period do
    start_on{ Date.today }
    end_on{ start_on + 29.days }
  end
end
