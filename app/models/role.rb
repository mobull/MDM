class Role < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  before_save :strip_name

  has_and_belongs_to_many :users
  has_many :allowed_actions

  ALLOWED_ACTION_OPTIONS = %w(
                              create_roles
                              assign_role_to_user
                              )

  def privileges
    allowed_actions.collect(&:name).collect(&:to_sym).uniq
  end

  private

    def strip_name
      self.name = name.strip
    end
end
