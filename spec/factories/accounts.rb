FactoryGirl.define do
  factory :account do
    sequence(:username) {|n| "username#{n}"}
    password 'secret'
    password_confirmation 'secret'
  end
end
