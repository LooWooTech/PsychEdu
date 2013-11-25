FactoryGirl.define do
  sequence(:username) {|n| "username#{n}"}
  factory :account do
    username
    password 'secret'
    password_confirmation 'secret'
  end
end
