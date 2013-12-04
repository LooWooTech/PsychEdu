FactoryGirl.define do
  factory :resuming do
    leaving_period
    date{ leaving_period.start_on + 3.days }
  end
end
