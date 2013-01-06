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

require 'spec_helper'

describe ProfileGenerator::IOS::GeneralPayload do

end
