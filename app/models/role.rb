class Role < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  before_save :strip_name

  private

    def strip_name
      self.name = name.strip
    end
end
