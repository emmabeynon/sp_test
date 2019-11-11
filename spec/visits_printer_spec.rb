require "spec_helper"
require "visits_printer"

RSpec.describe VisitsPrinter do
  let (:visits) { [["/path_a", 18], ["/path_b", 12], ["/path_c", 3]] }
  let (:printer) { VisitsPrinter.new(visits) }

  describe "#initialize" do
    it "accepts an array of visits to print" do
      expect(printer.visits).to eq (visits)
    end
  end

  describe "#print_visits" do
    it "prints the number of visits for each path" do
      visits = "/path_a 18 page visits\n/path_b 12 page visits\n/path_c 3 page visits\n"
      expect { printer.print_visits }.to output(visits).to_stdout
    end
  end
end
