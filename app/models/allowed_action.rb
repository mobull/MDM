# == Schema Information
#
# Table name: allowed_actions
#
#  role_id :integer
#  name    :string(255)
#

class AllowedAction < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :role

  validates :name, inclusion: { in: Role::ALLOWED_ACTION_OPTIONS }
  validates :role_id, presence: true
end
