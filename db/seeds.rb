# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Platform.destroy_all

Platform::IDENTIFIER_DISPLAY_NAME_MAP.each do |identifier, display_name|
  Platform.create(identifier: identifier, display_name: display_name)
end
