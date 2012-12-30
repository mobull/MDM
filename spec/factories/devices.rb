# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    user nil
    name { Faker::Lorem.words(3) }
    platform_identifier 'ios'
  end
end
