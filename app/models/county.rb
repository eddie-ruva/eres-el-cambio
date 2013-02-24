class County < ActiveRecord::Base
  attr_accessible :citizen_proposals, :community,
                  :happiness, :public_services, :security, :name

  validates     :name, presence: true

  validates     :citizen_proposals, :community,
                :happiness, :public_services, :security,
                numericality: true


  def self.get_default_county
    County.first
  end

end
