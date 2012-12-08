class AllowedAction < ActiveRecord::Base
  attr_accessible :name

  belongs_to :role

  validates :name, inclusion: { in: Role::ALLOWED_ACTION_OPTIONS }
  validates :role_id, presence: true
end
