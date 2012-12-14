require 'spec_helper'

describe DeviceOwnership do
  let(:device_ownership) { FactoryGirl.create(:device_ownership) }
  it "creates device_ownership" do
    expect { device_ownership }.to change(DeviceOwnership, :count).by(1)
  end
end
