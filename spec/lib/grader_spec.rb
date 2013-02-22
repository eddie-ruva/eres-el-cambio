require 'spec_helper'
require 'grader'

describe Grader do

  describe "#start grading" do
    before(:all) do
      Grader.new.start_grading
    end
    it "should have a key for security for a city" do
      REDIS.hgetall("monterrey").should have_key("security")
    end
    it "should have a key for public services for a city" do
      REDIS.hgetall("monterrey").should have_key("public_services")
    end
    it "should have a key for citizen proposals for a city" do
      REDIS.hgetall("monterrey").should have_key("citizen_proposals")
    end
    it "should have a key for community for a city" do
      REDIS.hgetall("monterrey").should have_key("community")
    end

  end
end
