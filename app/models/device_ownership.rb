# == Schema Information
#
# Table name: device_ownerships
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DeviceOwnership < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_many :devices

  validates :name, presence: true

  def to_s
    name
  end

  def to_param
    id
  end
end
