class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :omniauthable, :validatable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :username,  presence: true,
                        uniqueness: { case_sensitive: false }
  validates :password,  length: { minimum: 6 }

  has_and_belongs_to_many :roles
  has_many :allowed_actions, through: :roles

  def privileges
    allowed_actions.collect(&:name).collect(&:to_sym).uniq
  end
end
