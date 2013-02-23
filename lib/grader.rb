require 'cic_requester'
class Grader

  def start_grading
    grade_for_group :security
    grade_for_group :public_services
    grade_for_group :citizen_proposals
    grade_for_group :community
  end

  # Returns a descending sorted array of the counties sorted by all their attributes
  def rank_counties
    ranked_counties = County.all( :order =>
      'security desc, public_services desc, citizen_proposals desc, community desc, happiness desc'
    )
    ranked_counties
  end

  private

  def grade_for_group(group_name)
    reports = CicRequester.fetch_reports_by_group(group_name)
    reports.each do | county, reports_for_county |
      percentage = send "grade_#{group_name.to_s}", reports_for_county
      County.find_by_name(county.to_s).update_attributes(group_name => percentage)
    end
  end

  def grade_security(reports)
    # Hardcoded value, must change later
    total_reports_requested = 500
    ((reports.length * 100) / total_reports_requested).floor
  end

  def grade_public_services(reports)
    resolved_reports = reports.inject(0) do |count, report|
      count += 1 if report[:state] == "closed"
      count
    end
    ((resolved_reports * 100) / reports.length).floor
  end

  def grade_citizen_proposals(reports)
    reports.length
  end

  def grade_community(reports)
    reports.length
  end


end
