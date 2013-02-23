require 'spec_helper'
require 'grader'

describe Grader do

  describe "#start grading" do
    before(:all) do
      Grader.new.start_grading
    end
  end


  describe "rank counties" do
    county_mty = County.create(name: 'Monterrey', security: 50, public_services: 50, citizen_proposals: 50, community: 50, happiness: 50 )
    county_escobedo = County.create(name: 'Escobedo', security: 60, public_services: 60, citizen_proposals: 60, community: 60, happiness: 60 )
    county_test = County.create(name: 'Test', security: 55, public_services: 60, citizen_proposals: 60, community: 60, happiness: 60 )
    # It should return a descending sorted array
    # sorted by the average of the categories.
    grade = Grader.new
    ranked_counties = grade.rank_counties
    ranked_counties[0].name.should == county_escobedo.name
    ranked_counties[1].name.should == county_test.name
    ranked_counties[2].name.should == county_mty.name
  end
end
