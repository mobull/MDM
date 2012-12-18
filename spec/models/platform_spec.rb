require 'spec_helper'

describe Platform do
  IDENTIFIER_DISPLAY_NAME_MAP = {
    ios: 'Apple iOS',
    android: 'Android',
  }

  ALLOWED_IDENTIFIERS = IDENTIFIER_DISPLAY_NAME_MAP.keys.collect(&:to_s)

  it "has #{IDENTIFIER_DISPLAY_NAME_MAP.count} items" do
    Platform.should have(IDENTIFIER_DISPLAY_NAME_MAP.count).items
  end

  it 'rejects identifier modification' do
    expect { Platform.first.update_attribute(:identifier, 'Something New') }.to raise_error
  end

  it 'rejects duplicated identifier' do
    %w(ios iOS).each do |identifier|
      Platform.new(identifier: identifier).should_not be_valid
    end
  end

  it 'rejects blank identifier' do
    [nil, '', '  '].each do |identifier|
      Platform.new(identifier: identifier).should_not be_valid
    end
  end

  it 'rejects not allowed identifier' do
    Faker::Lorem.words(5).each do |identifier|
      Platform.new(identifier: identifier).should_not be_valid
    end
  end

  IDENTIFIER_DISPLAY_NAME_MAP.each do |identifier, display_name|
    describe ".#{identifier}" do
      context 'when record exists' do
        it 'returns iOS record' do
          Platform.send(identifier).display_name.should == display_name
        end
      end

      context 'when record does not exist' do
        before { Platform.find(identifier).delete }
        it 'creates a new platform ' do
          expect { Platform.send(identifier) }.to change(Platform, :count).by(1)
        end
      end
    end
  end

  describe '#devices' do
    before do
      (0..10).to_a.sample.times do
        FactoryGirl.create(:device, platform_identifier: ALLOWED_IDENTIFIERS.sample)
      end
    end

    it 'returns associated devices' do
      ALLOWED_IDENTIFIERS.each do |identifier|
        platform = Platform.send(identifier)
        platform.devices.should match_array(Device.where(platform_identifier: identifier))
      end
    end
  end
end
