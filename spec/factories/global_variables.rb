# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company_legal_name, class: GlobalVariable do
    name 'company_legal_name'
    content 'ACME Inc.'
  end
end
