# == Schema Information
#
# Table name: global_variables
#
#  name       :string(255)      not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe GlobalVariable do
  ALLOWED_VARIABLES = %w(company_legal_name company_display_name help_desk_guide)
  let(:company_legal_name) { FactoryGirl.create(:company_legal_name) }

  it 'rejects blank variable name' do
    [nil, '', '   '].each do |name|
      GlobalVariable.new(name: name).should_not be_valid
    end
  end

  it 'rejects duplicated variable name' do
    [company_legal_name.name, company_legal_name.name.upcase].each do |name|
      GlobalVariable.new(name: name).should_not be_valid
    end
  end

  it 'rejects variable names out of the whitelist' do
    Faker::Lorem.words(10).each do |radom_name|
      GlobalVariable.new(name: radom_name).should_not be_valid
    end
  end

  ALLOWED_VARIABLES.each do |allowed_variable_name|
    describe ".#{allowed_variable_name}=" do
      context 'when record does not exist' do
        it 'creates new record' do
          expect { GlobalVariable.send("#{allowed_variable_name}=", 'content') }.to change(GlobalVariable, :count).by(1)
        end
      end
      context 'when record exists' do
        before { GlobalVariable.send("#{allowed_variable_name}=", 'content') }
        it 'update record' do
          GlobalVariable.send("#{allowed_variable_name}=", 'new_content')
          GlobalVariable.send("#{allowed_variable_name}").should == 'new_content'
        end
      end
    end

    describe ".#{allowed_variable_name}" do
      context 'when content already assigned' do
        it 'returns the stored content' do
          ['string', 123, 9.99, :symbol, {order_id: 1}, ['a', 'b', 'c'], (0..9)].each do |content|
            GlobalVariable.send("#{allowed_variable_name}=", content)
            GlobalVariable.send(allowed_variable_name).should == content
          end
        end
      end

      context 'when content not assigned' do
        it 'returns nil' do
          GlobalVariable.send(allowed_variable_name).should be_nil
        end
      end
    end
  end
end
