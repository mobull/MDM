# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

  describe '#users' do
    let(:another_user) { FactoryGirl.create(:user) }
    before { role.users << [user, another_user] }

    subject { role.users }
    it { should have(2).users }
    it { should match_array([user, another_user])}
  end

  describe '#privileges' do
    before do
      %w(create_roles assign_role_to_user).each do |name|
        role.allowed_actions.create(name: name)
      end
    end

    it 'returns allowed action name symbols in array' do
      role.privileges.should match_array([:create_roles, :assign_role_to_user])
    end
  end
end
