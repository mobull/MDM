require 'spec_helper'

describe Group do
  let(:group) { FactoryGirl.create(:group) }
  let(:group_all_members) { FactoryGirl.create(:group_all_members) }

  it 'creates group via factory' do
    expect { group }.to change(Group, :count).by(1)
  end

  it 'rejects blank name' do
    [nil, '', '  '].each do |name|
      FactoryGirl.build(:group, name: name).should_not be_valid
    end
  end
end
