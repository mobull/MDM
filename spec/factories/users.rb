# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user_#{n}" }
    password 'password'
    password_confirmation 'password'
  end
end
