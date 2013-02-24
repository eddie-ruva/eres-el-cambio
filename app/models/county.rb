class County < ActiveRecord::Base
  attr_accessible :citizen_proposals, :community,
                  :happiness, :public_services, :security, :name

  validates     :name, presence: true

  validates     :citizen_proposals, :community,
                :happiness, :public_services, :security,
                numericality: true

  after_save :load_into_soulmate

  def self.get_default_county
    County.first
  end

  def load_into_soulmate
    loader = Soulmate::Loader.new("county")
    loader.add("term" => name, "id" => id)
  end

end
