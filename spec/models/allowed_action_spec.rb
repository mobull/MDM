# == Schema Information
#
# Table name: allowed_actions
#
#  role_id :integer
#  name    :string(255)
#

require 'spec_helper'

describe AllowedAction do
  let(:role) { FactoryGirl.create(:role) }
  let(:allowed_action) { FactoryGirl.create(:allowed_action) }
  let(:legit_action_names) { %w(create_roles assign_role_to_user) }

  it 'creates action via Factory' do
    expect { allowed_action }.to change(AllowedAction, :count).by(1)
  end

  it 'creates allowed action' do
    legit_action_names.each do |action_name|
      expect { role.allowed_actions.create!(name: action_name) }.to change(AllowedAction, :count)
    end
  end

  it 'rejects unknown names' do
    Faker::Lorem.words(10).each do |radom_name|
      expect { role.allowed_actions.create!(name: radom_name) }.to raise_error
    end
  end

  it 'rejects blank :role_id' do
    [nil, '', '   '].each do |id|
      expect { FactoryGirl.create(:allowed_action, role_id: nil) }.to raise_error
    end
  end

  describe '#role' do
    it 'returns associated role' do
      action = role.allowed_actions.create(name: 'create_roles')
      action.role.should == role
    end
  end
end
