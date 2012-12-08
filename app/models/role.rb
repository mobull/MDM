class Role < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  before_save :strip_name

  has_and_belongs_to_many :users

  private

    def strip_name
      self.name = name.strip
    end
end
