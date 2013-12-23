FactoryGirl.define do
  factory :video do
    sequence(:url){|n| "http://www.example.com/url-#{n}" } 
  end
end
