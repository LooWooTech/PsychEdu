FactoryGirl.define do
  factory :video do
    sequence(:url){|n| "http://www.example.com/url#{1}" } 
    unit
  end
end
