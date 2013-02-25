class County < ActiveRecord::Base
  attr_accessible :citizen_proposals, :community,
                  :happiness, :public_services, :security, :name

  validates     :name, presence: true

  validates     :citizen_proposals, :community,
                :happiness, :public_services, :security,
                numericality: true

  after_save :load_into_soulmate

  def self.search_for_term_name(term)
    matches = Soulmate::Matcher.new('county').matches_for_term(term)
    matches.map do |match|
      match["term"]
    end
  end

  def self.get_default_county
    County.first
  end

  def load_into_soulmate
    loader = Soulmate::Loader.new("county")
    loader.add("term" => name, "id" => id)
  end

  def self.find_by_closest_name(name)
    County.where("name LIKE ?", "%#{name}%").first
  end

end
