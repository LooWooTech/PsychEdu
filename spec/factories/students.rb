FactoryGirl.define do
  factory :student do
    name "jim"
    gender Student::GENDER['男']
    unit_code '1'
    account
  end
end
