require 'spec_helper'

describe Configuration do
  FIELDS_STORE_IN_GLOBAL_VARIABLES = [:company_legal_name, :company_display_name, :help_desk_guide]
  let(:configuration) { Configuration.new }
  let(:random_string) { Faker::Lorem.words(6) }

  describe '.new' do
    it 'returns a configuration instance' do
      configuration.should be_an_instance_of(Configuration)
    end
  end

  FIELDS_STORE_IN_GLOBAL_VARIABLES.each do |field|
    describe "##{field}=" do
      it 'alters corresponding instance variable' do
        configuration.send("#{field}=", random_string)
        configuration.instance_variable_get("@#{field}").should == random_string
      end
    end

    describe "##{field}" do
      it 'returns corresponding value in GlobalVariable' do
        configuration.send(field).should == GlobalVariable.find_by_name(field).try(:value)
      end
    end

    describe '#save' do
      before { configuration.send("#{field}=", random_string) }
      it 'saves corresponding value into GlobalVariable' do
        configuration.save
        GlobalVariable.find_by_name(field).try(:value).should == random_string
      end
    end
  end
end
