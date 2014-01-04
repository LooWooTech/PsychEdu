FactoryGirl.define do
  factory :choice do
    content "MyText"
    factory :correct_choice do
      correct  true
    end
  end
end
