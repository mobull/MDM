require 'spec_helper'

describe Device do
  let(:device) { FactoryGirl.create(:device) }

  it 'creates record via Factory' do
    expect { device }.to change(Device, :count).by(1)
  end
end
