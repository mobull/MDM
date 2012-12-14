require 'spec_helper'

describe Device do
  let(:device) { FactoryGirl.create(:device) }

  it 'creates record via Factory' do
    expect { device }.to change(Device, :count).by(1)
  end

  it 'rejects not allowed platform_identifier' do
    Faker::Lorem.words(5).each do |platform_identifier|
      FactoryGirl.build(:device, platform_identifier: platform_identifier).should_not be_valid
    end
  end

  describe '#platform' do
    it 'returns associated platform' do
      device.platform.should == Platform.find(device.platform_identifier)
    end
  end
end
