# == Schema Information
#
# Table name: platforms
#
#  identifier   :string(255)      primary key
#  display_name :string(255)
#

class Platform < ActiveRecord::Base
  IDENTIFIER_DISPLAY_NAME_MAP = {
    ios: 'Apple iOS',
    android: 'Android',
  }

  attr_accessible :identifier, :display_name
  attr_readonly :identifier
  self.primary_key = :identifier

  validates :identifier, uniqueness: { case_sensitive: false },
                         presence: true

  IDENTIFIER_DISPLAY_NAME_MAP.each do |identifier, display_name|
    define_singleton_method identifier.to_s do
      find_or_create_by_identifier(identifier: identifier, display_name: display_name)
    end
  end
end
