require_relative "log_validator"
require_relative "page_visit_counter"
require_relative "visit_count_orderer"
require_relative "visits_printer"

class Parser
  attr_reader :logfile

  def initialize(logfile)
    @logfile = logfile
  end

  def ordered_page_visits(unique: false)
    validated_pages = LogValidator.new(logfile).validate
    page_visits = page_visit_count(validated_pages, unique)
    ordered_page_visits = VisitCountOrderer.new(page_visits).order_descending
    VisitsPrinter.new(ordered_page_visits).print_visits
  end

private

  def page_visit_count(pages, unique)
    counter = PageVisitCounter.new(pages)
    unique ? counter.count_unique_visits : counter.count_visits
  end
end

if $0 == __FILE__
  raise "Please provide a path to a logfile" unless ARGV[0]

  logfile = ARGV[0]
  unique_visits = ARGV.last == "--unique"
  Parser.new(logfile).ordered_page_visits(unique: unique_visits)
end
