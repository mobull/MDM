# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  password_digest :string(255)      default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string(255)
#  bio             :text
#  email           :string(255)
#

class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :bio, :email, :password, :password_confirmation

  has_and_belongs_to_many :roles
  has_many :allowed_actions, through: :roles
  has_and_belongs_to_many :groups, order: 'priority DESC'

  def privileges
    allowed_actions.collect(&:name).collect(&:to_sym).uniq
  end

  def to_s
    name.blank? ? email : name
  end
  alias_method :to_label, :to_s

  def self.find_by_login(login)
    find_by_email(login)
  end

  def self.authenticate(username_and_password_hash)
    user = find_by_login(username_and_password_hash[:login])
    user && user.authenticate(username_and_password_hash[:password])
  end
end
