require 'grader'

module CitiesGrader
  @queue = :cities_reviewing
  def self.perform
    grader = Grader.new
    grader.start_grading
  end

end
