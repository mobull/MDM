# == Schema Information
#
# Table name: devices
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  name                :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  platform_identifier :string(255)      default("ios"), not null
#  device_ownership_id :integer
#

class Device < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :platform, primary_key: :identifier, foreign_key: :platform_identifier
  belongs_to :device_ownership

  validates :platform_identifier, inclusion: { in: Platform::ALLOWED_IDENTIFIERS }

  def to_s
    name.blank? ? '(Untitled Device)' : name
  end

  def general_payload(host = '')
    case platform_identifier
    when 'ios'
      ios_general_payload(host)
    end
  end

  def general_profile(host = '')
    case platform_identifier
    when 'ios'
      ios_configuration_profile(host)
    end
  end

  private

    def ios_configuration_payload(host = '')
      {
        PayloadType: 'Profile Service',
        PayloadIdentifier: GlobalVariable.payload_identifier,
        PayloadDisplayName: GlobalVariable.payload_display_name,
        PayloadDescription: GlobalVariable.payload_description,
        PayloadContent: {
          URL: "#{host}#{ios_enrollments_path(host: host, device_id: id)}",
          DeviceAttributes: %w(UDID VERSION PRODUCT MAC_ADDRESS_EN0 DEVICE_NAME IMEI ICCID),
          },
          Challenge: SecureRandom.base64(64)
      }
    end

    def ios_configuration_profile(host)
      ios_general_payload(host).to_plist
    end
end
