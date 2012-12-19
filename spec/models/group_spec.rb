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

  it 'rejects more than one group_all_members' do
    group_all_members
    FactoryGirl.build(:group_all_members, name: 'Another All Members').should_not be_valid
  end

  describe '.all_members' do
    context 'when group_all_members does not exist' do
      before { Group.where(should_include_everyone: true).delete_all }

      it 'creates the group' do
        expect { Group.all_members }.to change(Group, :count).by(1)
      end
      it 'returns the group' do
        Group.all_members.should_include_everyone?.should be_true
      end
    end

    context 'when group_all_members exist' do    
      it 'returns the group' do
        Group.all_members.should_include_everyone?.should be_true
      end
    end
  end

  describe '#everyone_is_included?' do
    context 'when count of group members equals to the count of all users' do
      it 'returns true'
    end

    context 'when count of group members does not equal to the count of all users' do
      it 'returns false'
    end
  end

  describe '.reconstruct_group_all_members!' do
    context 'when count of group_all_members equals to the count of all users' do
      it 'does nothing'
    end

    context 'when count of group members does not equal to the count of all users' do
      it 'does the reconstruction'
    end
  end
end
