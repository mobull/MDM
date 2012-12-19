require 'spec_helper'

describe Group do
  let(:group) { FactoryGirl.create(:group) }

  it 'creates group via factory' do
    expect { group }.to change(Group, :count).by(1)
  end

  it 'rejects blank name' do
    [nil, '', '  '].each do |name|
      FactoryGirl.build(:group, name: name).should_not be_valid
    end
  end

  describe '#to_s' do
    it 'returns group name' do
      group.to_s.should == group.name
    end
  end

  describe '.higher_priority_first' do
    before do
      (0..10).to_a.shuffle.each do |priority|
        FactoryGirl.create(:group, priority: priority)
      end
    end

    it 'returns an array by descent sequent of priority number' do
      Group.higher_priority_first.map(&:priority).should == (0..10).to_a.reverse
    end
  end
end
