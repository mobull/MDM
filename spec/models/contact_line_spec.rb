# == Schema Information
#
# Table name: contact_lines
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category    :string(255)      not null
#  content     :string(255)      not null
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe ContactLine do
  ALLOWED_CATEGORIES = %w(phone email address)
  let(:contact_line) { FactoryGirl.create(:contact_line) }
  let(:email_contact_line) { FactoryGirl.create(:email_contact_line) }
  let(:phone_contact_line) { FactoryGirl.create(:phone_contact_line) }
  let(:address_contact_line) { FactoryGirl.create(:address_contact_line) }

  it 'creates a new record' do
    expect { contact_line }.to change(ContactLine, :count).by(1)
  end

  it 'rejects blank category' do
    [nil, '', '   '].each do |category|
      FactoryGirl.build(:contact_line, category: category).should_not be_valid
    end
  end

  it 'rejects unallowed category' do
    Faker::Lorem.words(10).each do |category|
      FactoryGirl.build(:contact_line, category: category).should_not be_valid
    end
  end

  it 'rejects blank content' do
    [nil, '', '  '].each do |content|
      FactoryGirl.build(:contact_line, content: content).should_not be_valid
    end
  end

  context 'when category is email' do
    it 'creates new record for valid email addresses' do
      10.times do
        FactoryGirl.build(:email_contact_line, content: Faker::Internet.email).should be_valid
      end
    end

    it 'rejects invalid email address' do
      FactoryGirl.build(:email_contact_line, content: 'invalid@email').should_not be_valid
    end
  end

  ALLOWED_CATEGORIES.each do |category|
    describe "##{category}?" do
      context "when category is #{category}" do
        it 'returns true' do
          contact_line = FactoryGirl.create("#{category}_contact_line")
          contact_line.send("#{category}?").should be_true
        end
      end

      context "when category is not #{category}" do
        it 'returns false' do
          (ALLOWED_CATEGORIES - [category]).each do |another_category|
            contact_line = FactoryGirl.create("#{another_category}_contact_line")
            contact_line.send("#{category}?").should be_false
          end
        end
      end
    end
  end
end
