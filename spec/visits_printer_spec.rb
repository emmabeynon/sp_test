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
end
