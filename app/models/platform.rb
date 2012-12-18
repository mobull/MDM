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

  ALLOWED_IDENTIFIERS = IDENTIFIER_DISPLAY_NAME_MAP.keys.collect(&:to_s)

  attr_accessible :identifier, :display_name
  attr_readonly :identifier
  self.primary_key = :identifier

  validates :identifier, uniqueness: { case_sensitive: false },
                         presence: true,
                         inclusion: { in: ALLOWED_IDENTIFIERS }

  has_many :devices, foreign_key: :platform_identifier

  IDENTIFIER_DISPLAY_NAME_MAP.each do |identifier, display_name|
    define_singleton_method identifier.to_s do
      find_or_create_by_identifier(identifier: identifier.to_s, display_name: display_name)
    end
  end
end
