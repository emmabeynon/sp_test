require_relative "log_validator"
require_relative "page_visit_counter"
require_relative "visit_count_orderer"
require_relative "visits_printer"

class Parser
  attr_reader :logfile

  def initialize(logfile)
    @logfile = logfile
  end

  def ordered_page_visits
    validated_pages = LogValidator.new(logfile).validate
    page_visit_count = PageVisitCounter.new(validated_pages).count_visits
    ordered_page_visits = VisitCountOrderer.new(page_visit_count).order_descending
    VisitsPrinter.new(ordered_page_visits).print_visits
  end
end

if $0 == __FILE__
  raise "Please provide a path to a logfile" unless ARGV[0]

  logfile = ARGV[0]
  Parser.new(logfile).ordered_page_visits
end
