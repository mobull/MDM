# == Schema Information
#
# Table name: global_variables
#
#  name       :string(255)      not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GlobalVariable < ActiveRecord::Base
  self.primary_key = :name

  attr_accessible :name, :content

  serialize :content

  ALLOWED_VARIABLES = %w(
                         configuration_updated_at
                         company_legal_name
                         company_display_name
                         help_desk_guide
                         ios_payload_identifier
                         ios_payload_display_name
                         ios_payload_description
                         )

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   inclusion: { in: ALLOWED_VARIABLES }

  ALLOWED_VARIABLES.each do |variable_name|
    define_singleton_method variable_name do
      find_by_name(variable_name).try(:content)
    end

    define_singleton_method "#{variable_name}=" do |content|
      variable = find_or_create_by_name(name: variable_name, content: content)
      unless variable.content == content
        variable.update_attributes(content: content)
      end
    end
  end
end
