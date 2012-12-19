# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  priority   :integer
#

class Group < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :name, presence: true

  has_and_belongs_to_many :users

  scope :higher_priority_first, order('priority DESC')

  def to_s
    name
  end
end
