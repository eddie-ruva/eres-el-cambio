class Initiative < ActiveRecord::Base
  attr_accessible :author, :county_id, :description, :group

  validates :description, :county_id, :group, presence: true

  validates :county_id, numericality: true
end
