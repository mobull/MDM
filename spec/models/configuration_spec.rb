require 'spec_helper'

describe Configuration do
  FIELDS_STORE_IN_GLOBAL_VARIABLES = [
    :company_legal_name,
    :company_display_name,
    :help_desk_guide,
    :ios_payload_identifier,
    :ios_payload_display_name,
    :ios_payload_description,
  ]

  let(:configuration) { Configuration.new }
  let(:random_string) { Faker::Lorem.words(6).join(' ') }

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
      it 'returns corresponding content in GlobalVariable' do
        configuration.send(field).should == GlobalVariable.find_by_name(field)
          .try(:content)
      end
    end

    describe '#save' do
      before { configuration.send("#{field}=", random_string) }
      it 'saves corresponding content into GlobalVariable' do
        configuration.save
        GlobalVariable.find_by_name(field).try(:content).should == random_string
      end
    end
  end

  describe '#update_attributes(params)' do
    let(:params) do
      params = {}
      FIELDS_STORE_IN_GLOBAL_VARIABLES.each do |field|
        params.merge!(field.to_sym => "new_#{field}")
      end
      params
    end

    it 'updates fields massively' do
      configuration.update_attributes(params)
      FIELDS_STORE_IN_GLOBAL_VARIABLES.each do |field|
        Configuration.new.send(field).should == "new_#{field}"
      end
    end
  end
end
