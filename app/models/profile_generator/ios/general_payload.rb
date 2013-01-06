# == Schema Information
#
# Table name: profile_generator_ios_general_payload
#
#  id                       :integer          not null, primary key
#  HasRemovalPasscode       :boolean
#  IsEncrypted              :boolean
#  PayloadDescription       :string(255)
#  PayloadDisplayName       :string(255)
#  PayloadRemovalDisallowed :boolean
#  PayloadType              :string(255)      default("Configuration"), not null
#  PayloadVersion           :integer          default(1), not null
#  PayloadScope             :boolean
#  RemovalDate              :date
#  DurationUntilRemoval     :float
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

module ProfileGenerator
  module IOS
    class GeneralPayload < ActiveRecord::Base
      self.table_name = 'profile_generator_ios_general_payload'

      attr_reader :PayloadOrganization, :PayloadIdentifier, :PayloadUUID

      after_initialize do
        @PayloadOrganization = GlobalVariable.company_legal_name
        @PayloadIdentifier = "com.#{GlobalVariable.company_identifier}."\
                             "#{Rails::Application.subclasses.first.to_s.split('::').first.underscore}."\
                             "profile-services.general"
        @PayloadUUID = SecureRandom.uuid
      end
    end
  end
end
