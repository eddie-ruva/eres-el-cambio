class CicRequester
  include HTTParty
  base_uri 'api.nl.cic.mx'


  GROUPS = { :public_services => 137, :security => 135,
             :citizen_proposals => 257, :community => 133}

  def self.fetch_reports_by_group(group_name, options = {})
    if group_name
      group_id = GROUPS[group_name]
      options.merge!({:for_group => group_id})
      classify_per_county get('/0/nl/reports.json', :query => options)
    else
      {}
    end
  end


  private

  def self.classify_per_county(reports)
    reports_by_county = {}
    reports['reports'].each do |report|
      county = report['address_detail']['county']['long_name']
      if county
        mini_report = { :ticket => report['ticket'],
                        :state => report['state'],
                        :group => report['group'].downcase }
        if reports_by_county[county.to_sym]
          reports_by_county[county.to_sym] << mini_report
        else
          County.find_or_create_by_name(county)
          reports_by_county[county.to_sym] = [mini_report]
        end
      end
    end
    reports_by_county
  end

end
