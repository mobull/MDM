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
end
