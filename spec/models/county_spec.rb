require 'spec_helper'

describe County do
  let!(:county) { County.new(name: "monterrey", security:100)}
  describe '#valid?' do
    it 'is valid with proper attributes' do
      county.save
      county.valid?.should == true
    end

    it 'is invalid withou a name' do
      county.name = nil
      county.valid?.should == false
    end

    it 'is invalid with a percentage attribute with a string' do
      county.security = "hola"
      county.valid?.should == false
    end
  end
end
