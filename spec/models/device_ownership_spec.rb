# == Schema Information
#
# Table name: device_ownerships
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe DeviceOwnership do
  let(:device_ownership) { FactoryGirl.create(:device_ownership) }

  it 'creates device_ownership' do
    expect { device_ownership }.to change(DeviceOwnership, :count).by(1)
  end

  it 'rejects blank name' do
    [nil, '', '   '].each do |name|
      DeviceOwnership.new(name: name).should_not be_valid
    end
  end

  describe '#devices' do
    before do
      (0..10).to_a.sample.times do
        device_ownership.devices.create!(name: Faker::Lorem.word, platform_identifier: Platform::ALLOWED_IDENTIFIERS.sample)
      end
    end

    it 'returns associated devices' do
      device_ownership.devices.should match_array(Device.where(device_ownership_id: device_ownership.id))
    end
  end

  describe '#to_s' do
    it 'returns name' do
      device_ownership.to_s.should == device_ownership.name
    end
  end

  describe '#to_param' do
    it 'returns id' do
      device_ownership.to_param.should == device_ownership.id
    end
  end
end
