require "spec_helper"
require "page_visit_counter"

RSpec.describe PageVisitCounter do
  let(:paths) { %w(/path_a /path_b /path_a) }

  describe "#initialize" do
    it "accepts an array of paths as an argument" do
      counter = described_class.new(paths)
      expect(counter.paths).to eq(paths)
    end
  end

  describe "#count_visits" do
    it "returns a hash of pages and number of visits" do
      counter = described_class.new(paths)
      expect(counter.count_visits).to include(
        "/path_a" => 2,
        "/path_b" => 1,
      )
    end
  end
end
