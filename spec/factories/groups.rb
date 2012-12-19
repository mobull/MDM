# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name { Faker::Lorem.word }
    should_include_everyone false
  end

  factory :group_all_members, parent: :group do
    name "All Members"
    should_include_everyone true
  end
end
