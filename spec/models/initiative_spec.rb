require 'spec_helper'

describe Initiative do
  let!(:initiative) { Initiative.new(author:"Test author", county_id: 1, description:"A test description", group: "test group")}
  describe "#valid?" do
    it 'is valid with proper attributes' do
      initiative.save
      initiative.valid?.should == true
    end

    it 'is invalid without a description' do
      initiative.description = nil
      initiative.valid?.should == false
    end

    it 'is invalid without a county_id' do
      initiative.county_id = nil
      initiative.valid?.should == false
    end

    it 'is invalid without a group' do
      initiative.group = nil
      initiative.valid?.should == false
    end

    it 'is invalid with a county_id as a string' do
      initiative.county_id = "not a number"
      initiative.valid?.should == false
    end
  end
end
