FactoryGirl.define do
  factory :video do
    unit
    sequence(:url){|n| "http://www.example.com/url-#{n}" } 
  end
end
