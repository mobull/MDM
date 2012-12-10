class ContactLine < ActiveRecord::Base
  belongs_to :user
  attr_accessible :category, :content, :description

  ALLOWED_CATEGORIES = %w(phone email address)

  validates :category,  presence: true,
                        inclusion: { in: ALLOWED_CATEGORIES }
  validates :content,   presence: true
  validate  :validates_content

  ALLOWED_CATEGORIES.each do |category_name|
    define_method "#{category_name}?" do
      category == category_name
    end
  end

  private

    def validates_content
      if email? && (content || '').invalid_email_address?
        errors.add(:content, 'is not a valid email address')
      end
    end
end
