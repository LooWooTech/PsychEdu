FactoryGirl.define do
  factory :student do
    name "jim"
    gender Student::GENDER[:male]
    unit_code '1'
    account
  end
end
