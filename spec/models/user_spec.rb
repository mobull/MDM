# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  password_digest :string(255)      default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string(255)
#  bio             :text
#  email           :string(255)
#

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
      password = 'x' * i
      FactoryGirl.build(:user, password: password, password_confirmation: password).should_not be_valid
    end
  end

  it 'rejects unmatched password_confirmation' do
    FactoryGirl.build(:user, password: 'password', password_confirmation: 'another_password').should_not be_valid
  end

  it 'rejects blank email' do
    [nil, '', '   '].each { |email| FactoryGirl.build(:user, email: email).should_not be_valid }
  end

  it 'rejects duplicated email' do
    FactoryGirl.build(:user, email: user.email).should_not be_valid
  end

  it 'rejects invalid email format' do
    %w(user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com).each do |invalid_email|
      FactoryGirl.build(:user, email: invalid_email).should_not be_valid
    end
  end

  it 'alters email address to down case' do
    user = FactoryGirl.create(:user, email: 'XMARCO.INFO@GMAIL.COM')
    user.email.should == 'xmarco.info@gmail.com'
  end

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

  describe '#groups' do
    before do
      @group_ids = []
      (0..10).to_a.shuffle.each do |priority|
        group = FactoryGirl.create(:group, priority: priority)
        user.groups << group
        @group_ids << group.id
      end
    end

    it 'returns associated groups' do
      user.groups.collect(&:id).should match_array(@group_ids)
    end

    it 'returns groups by the descent sequent of group priority' do
      user.groups.map(&:priority).should == (0..10).to_a.reverse
    end
  end

  describe '.find_by_login(login)' do
    context 'when login param is email' do
      context 'when email exists' do
        before { user }
        it 'returns the user' do
          User.find_by_login(user.email).should == user
        end
      end

      context 'when email does not exist' do
        it 'returns nil' do
          User.find_by_login('email@example.com').should be_nil
        end
      end
    end
  end

  describe '.authenticate(username_and_password_hash)' do
    before { user }
    context 'when login credential is valid' do
      it 'returns the user' do
        User.authenticate(login: user.email, password: 'password').should == user
      end
    end

    context 'when login credential is invalid' do
      it 'returns false' do
        User.authenticate(login: user.email, password: 'invalid_password').should be_false
      end
    end
  end
end
