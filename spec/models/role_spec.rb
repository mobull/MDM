require 'spec_helper'

describe Role do

  let(:role) { FactoryGirl.create(:role) }

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
end
