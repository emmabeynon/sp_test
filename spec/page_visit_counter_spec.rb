require "spec_helper"
require "page_visit_counter"

RSpec.describe PageVisitCounter do
  let(:paths_and_visits) do
    [%w(/path_a 123.456), %w(/path_b 123.456), %w(/path_a 123.456)]
  end

  let(:counter) { described_class.new(paths_and_visits) }

  describe "#initialize" do
    it "accepts an array of paths as an argument" do
      expect(counter.paths).to eq(paths_and_visits)
    end
  end

  describe "#count_visits" do
    it "returns a hash of pages and number of visits" do
      expect(counter.count_visits).to include(
        "/path_a" => 2,
        "/path_b" => 1,
      )
    end

    it "raises an error if the paths aren't provided as an array" do
      counter = described_class.new("a path")
      expect { counter.count_visits }.to raise_error(
        RuntimeError, "Paths must be provided as an array"
      )
    end
  end

  describe "#count_unique_visits" do
    it "returns a hash of pages and unique visits" do
      counter = described_class.new(paths_and_visits)
      expect(counter.count_unique_visits).to include(
        "/path_a" => 1,
        "/path_b" => 1,
      )
    end
  end
end
