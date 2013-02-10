require 'spec_helper'
require 'cic_requester'

describe CicRequester do
  it "should fetch all the security reports" do
    reports_json = CicRequester.fetch_reports_by_group("security")
    reports_json['reports'][0]['group'].should == 'Seguridad'
  end

  it "should fetch all the public services reports" do
    reports_json = CicRequester.fetch_reports_by_group("public_services")
    reports_json['reports'][0]['group'].should == 'Servicios Publicos (CS)'
  end

  it "should fetch all the public services reports" do
    reports_json = CicRequester.fetch_reports_by_group("citizen_proposals")
    reports_json['reports'][0]['group'].should == 'Propuestas Ciudadanas'
  end

  it "should fetch all the public services reports" do
    reports_json = CicRequester.fetch_reports_by_group("community")
    reports_json['reports'][0]['group'].should == 'Comunidad'
  end

end
