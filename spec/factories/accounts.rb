FactoryGirl.define do
  factory :account do
    login 'login'
    password 'secret'
    password_confirmation 'secret'
  end
end
