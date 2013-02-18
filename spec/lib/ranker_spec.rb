require 'spec_helper'
require 'ranker'

describe Ranker do

  describe "#start ranking" do
    before(:all) do
      Ranker.new.start_ranking
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
