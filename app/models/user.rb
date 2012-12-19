# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  failed_attempts        :integer          default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  bio                    :text
#  email                  :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :timeoutable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :bio

  has_and_belongs_to_many :roles
  has_many :allowed_actions, through: :roles
  has_and_belongs_to_many :groups

  def privileges
    allowed_actions.collect(&:name).collect(&:to_sym).uniq
  end

  def to_s
    name.blank? ? email : name
  end
  alias_method :to_label, :to_s
end
