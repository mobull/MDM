# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_line do
    association :user, factory: :user
    category 'email'
    content { Faker::Internet.email }
    description "Work"
  end

  factory :email_contact_line, parent: :contact_line

  factory :phone_contact_line, parent: :contact_line do
    category 'phone'
  end

  factory :address_contact_line, parent: :contact_line do
    category 'address'
  end
end
