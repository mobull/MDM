require 'spec_helper'

describe User do
  let (:user) { FactoryGirl.create(:user) }

  it 'creates user via Factory' do
    expect { user }.to change(User, :count).by(1)
  end

  it 'rejects blank username' do
    [nil, ' ', ''].each do |username|
      expect { FactoryGirl.create(:user, username: username) }.to raise_error
    end
  end

  it 'strips username' do
    user = FactoryGirl.create(:user, username: '   username ')
    user.username.should == 'username'
  end

  it 'rejects duplicated username' do
    FactoryGirl.create(:user, username: 'username')
    ['Username', 'USERNAME', 'UserName'].each do |username|
      expect { FactoryGirl.create(:user, username: username) }.to raise_error
    end
  end

  it 'alters username to downcast' do
    user = FactoryGirl.create(:user, username: 'Username')
    user.username.should == 'username'
  end

  it 'rejects short password (length < 6)' do
    (0..5).each do |i|
      expect { FactoryGirl.create(:user, password: 'x' * i) }.to raise_error
    end
  end
end
