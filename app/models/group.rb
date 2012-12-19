# == Schema Information
#
# Table name: groups
#
#  id                      :integer          not null, primary key
#  name                    :string(255)      not null
#  should_include_everyone :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Group < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :name, presence: true
  validate  :allowed_only_one_group_all_members

  has_and_belongs_to_many :users

  def self.all_members
    find_or_create_by_should_include_everyone(should_include_everyone: true,
                                              name: 'All Members')
  end

  private

    def allowed_only_one_group_all_members
      if Group.find_by_should_include_everyone(true)
        errors.add(:should_include_everyone, 'can\'t be set to this value.')
      end
    end
end
