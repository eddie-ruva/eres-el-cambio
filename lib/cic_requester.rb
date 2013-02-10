class CicRequester
  include HTTParty
  base_uri 'api.nl.cic.mx'


  GROUPS = { :public_services => 137, :security => 135,
             :citizen_proposals => 257, :community => 133}

  def self.fetch_reports_by_group(group_name, options = {})
    if group_name
      group_id = GROUPS[group_name.to_sym]
      options.merge!({:for_group => group_id})
      get('/0/nl/reports.json', :query => options)
    else
      {}
    end
  end
end
