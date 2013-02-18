require 'cic_requester'
class Ranker

  def start_ranking
    rank_for_group :security
    rank_for_group :public_services
    rank_for_group :citizen_proposals
    rank_for_group :community
  end


  private

  def rank_for_group(group_name)
    reports = CicRequester.fetch_reports_by_group(group_name)
    reports.each do | county, reports_for_county |
      percentage = send "rank_#{group_name.to_s}", reports_for_county
      REDIS.hset county.to_s, group_name.to_s, percentage
    end
  end

  def rank_security(reports)
    # Hardcoded value, must change later
    total_reports_requested = 500
    ((reports.length * 100) / total_reports_requested).floor
  end

  def rank_public_services(reports)
    resolved_reports = reports.inject(0) do |count, report|
      count += 1 if report[:state] == "closed"
      count
    end
    ((resolved_reports * 100) / reports.length).floor
  end

  def rank_citizen_proposals(reports)
    reports.length
  end

  def rank_community(reports)
    reports.length
  end


end
