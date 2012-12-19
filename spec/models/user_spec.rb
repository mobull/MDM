require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  let(:role) { FactoryGirl.create(:role) }
  let(:another_role) { FactoryGirl.create(:role) }

  it 'creates user via Factory' do
    expect { user }.to change(User, :count).by(1)
  end

  it 'rejects short password (length < 6)' do
    (0..5).each do |i|
      FactoryGirl.build(:user, password: 'x' * i).should_not be_valid
    end
  end

  pending 'adds users to group all members'

  describe '#roles' do
    before { user.roles << [role, another_role] }

    subject { user.roles }
    it { should have(2).roles }
    it { should match_array([role, another_role])}
  end

  describe '#privileges' do
    before do 
      user.roles << [role, another_role]
      allowed_action_1 = role.allowed_actions.create(name: 'create_roles')
      allowed_action_2 = role.allowed_actions.create(name: 'assign_role_to_user')
      allowed_action_3 = another_role.allowed_actions.create(name: 'assign_role_to_user')
    end

    it 'returns allowed action name symbols in array' do
      user.privileges.should match_array([:create_roles, :assign_role_to_user])
    end
  end

  describe '#to_s' do
    context 'when name is blank' do
      it 'returns email address' do
        [nil, '', '  '].each do |name|
          user = FactoryGirl.create(:user, name: name)
          user.to_s.should == user.email
        end
      end
    end

    context 'when name is not blank' do
      it 'returns name' do
        user = FactoryGirl.create(:user, name: 'Marco Y.')
        user.to_s.should == 'Marco Y.'
      end
    end
  end
end
