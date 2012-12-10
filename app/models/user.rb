class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :timeoutable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :bio

  has_and_belongs_to_many :roles
  has_many :allowed_actions, through: :roles

  def privileges
    allowed_actions.collect(&:name).collect(&:to_sym).uniq
  end
end
