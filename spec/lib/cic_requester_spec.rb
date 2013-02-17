require 'spec_helper'
require 'cic_requester'

describe CicRequester do

  describe "#fetch_reports_by_group" do
    it "should fetch all the security reports" do
      reports_json = CicRequester.fetch_reports_by_group("security")
      city = reports_json.keys[0]
      reports_json[city][0][:group].should == 'seguridad'
    end

    it "should fetch all the public services reports" do
      reports_json = CicRequester.fetch_reports_by_group("public_services")
      city = reports_json.keys[0]
      reports_json[city][0][:group].should == 'servicios publicos (cs)'
    end

    it "should fetch all the public services reports" do
      reports_json = CicRequester.fetch_reports_by_group("citizen_proposals")
      city = reports_json.keys[0]
      reports_json[city][0][:group].should == 'propuestas ciudadanas'
    end

    it "should fetch all the public services reports" do
      reports_json = CicRequester.fetch_reports_by_group("community")
      city = reports_json.keys[0]
      reports_json[city][0][:group].should == 'comunidad'
    end
  end

end
