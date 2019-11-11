class VisitsPrinter
  attr_reader :visits

  def initialize(visits)
    @visits = visits
  end

  def print_visits
    visits.each { |path, visits| puts "#{path} #{visits} page visits" }
  end
end
