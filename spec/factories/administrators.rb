# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :administrator do
    login 'admin'
    password 'secret'
    password_confirmation 'secret'
  end
end