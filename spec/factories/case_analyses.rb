# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :case_analysis do
    content "MyText"
    topic nil
    created_by nil
  end
end
