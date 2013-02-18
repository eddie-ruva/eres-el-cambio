require 'ranker'

module CitiesGrader
  @queue = :cities_reviewing
  def self.perform
    Ranker.new.start_ranking
  end

end
