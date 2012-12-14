# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Device < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :user
end
