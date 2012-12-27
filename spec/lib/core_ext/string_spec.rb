require 'spec_helper'

describe String do
  describe '#valid_email_address?' do
    context 'when the string is an invalid email' do
      it 'returns false' do
        %w(user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com).each do |email|
          email.valid_email_address?.should be_false
        end
      end
    end

    context 'when the string is a valid email' do
      it 'returns true' do
        10.times do
          Faker::Internet.email.valid_email_address?.should be_true
        end
      end
    end
  end

  describe '#invalid_email_address?' do
    context 'when the string is an invalid email' do
      it 'returns true' do
        %w(user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com).each do |email|
          email.invalid_email_address?.should be_true
        end
      end
    end

    context 'when the string is a valid email' do
      it 'returns false' do
        10.times do
          Faker::Internet.email.invalid_email_address?.should be_false
        end
      end
    end
  end
end
