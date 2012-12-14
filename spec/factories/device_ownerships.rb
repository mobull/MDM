# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device_ownership do
    name 'Corporate - Dedicated'
  end

  factory :corporate_dedicated_ownership, parent: :device_ownership
  factory :corporate_shared_ownership, parent: :device_ownership do
    name 'Corporate - Shared'
  end
  factory :employee_owned, parent: :device_ownership do
    name 'Employee Owned'
  end
end
