require "spec_helper"
require "visit_count_orderer"

RSpec.describe VisitCountOrderer do
  let(:page_visits) do
    { "/path_a" => 5,
      "/path_b" => 23,
      "/path_c" => 16 }
  end

  describe "#initialize" do
    it "accepts a hash of pages and visit counts" do
      orderer = described_class.new(page_visits)
      expect(orderer.page_visits).to eq(page_visits)
    end
  end
end
