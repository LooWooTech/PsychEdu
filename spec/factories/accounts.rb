FactoryGirl.define do
  sequence(:login) {|n| "login#{n}"}
  factory :account do
    login
    password 'secret'
    password_confirmation 'secret'
  end
end
