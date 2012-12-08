# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :allowed_action do
    association :role, factory: :role
    name 'create_roles'
  end
end
