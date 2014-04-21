FactoryGirl.define do
  factory :learning_period_resuming do
    start_on{ Date.today }
    review_state{ PeriodApplication::review_states[:accepted] }
  end
end
