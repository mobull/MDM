# == Schema Information
#
# Table name: devices
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  name                :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  platform_identifier :string(255)      default("ios"), not null
#  device_ownership_id :integer
#

class Device < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :user
  belongs_to :platform, primary_key: :identifier, foreign_key: :platform_identifier
  belongs_to :device_ownership

  validates :platform_identifier, inclusion: { in: Platform::ALLOWED_IDENTIFIERS }

  def to_s
    name.blank? ? '(Untitled Device)' : name
  end
end
