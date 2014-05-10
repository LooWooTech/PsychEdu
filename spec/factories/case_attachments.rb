# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :case_attachment do
    file "MyString"
    case_analysis nil
  end
end
