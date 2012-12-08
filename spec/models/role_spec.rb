require 'spec_helper'

describe Role do

  let(:role) { FactoryGirl.create(:role) }
  let(:user) { FactoryGirl.create(:user) }

  it 'creates role via Factory' do
    expect { role }.to change(Role, :count).by(1)
  end

  it 'rejects blank name' do
    [nil, '', '  '].each do |name|
      expect { FactoryGirl.create(:role, name: name) }.to raise_error
    end
  end

  context 'when role is being created' do
    it 'strips name' do
      role = FactoryGirl.create(:role, name: ' name   ')
      role.name = 'name'
    end
  end

  context 'when role is being updated' do
    it 'strips name' do
      role.update_attributes(name: '    name ')
      role.name = 'name'
    end
  end

  describe '#roles' do
    let(:another_user) { FactoryGirl.create(:user) }
    before { role.users << [user, another_user] }

    subject { role.users }
    it { should have(2).users }
    it { should match_array([user, another_user])}
  end
end
