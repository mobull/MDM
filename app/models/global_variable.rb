class GlobalVariable < ActiveRecord::Base
  self.primary_key = :name

  attr_accessible :name, :value

  serialize :value

  ALLOWED_VARIABLES = %w(company_legal_name company_display_name help_desk_guide)

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   inclusion: { in: ALLOWED_VARIABLES }

  ALLOWED_VARIABLES.each do |variable_name|
    define_singleton_method variable_name do
      find_by_name(variable_name).try(:value)
    end

    define_singleton_method "#{variable_name}=" do |value|
      variable = find_or_create_by_name(name: variable_name, value: value)
      variable.update_attributes(value: value) unless variable.value == value
    end
  end
end
