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
end
