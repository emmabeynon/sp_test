require "spec_helper"
require "visit_count_orderer"

RSpec.describe VisitCountOrderer do
  let(:page_visits) do
    { "/path_a" => 5,
      "/path_b" => 23,
      "/path_c" => 16 }
  end

  let(:orderer) { described_class.new(page_visits) }

  describe "#initialize" do
    it "accepts a hash of pages and visit counts" do
      expect(orderer.page_visits).to eq(page_visits)
    end
  end

  describe "#order_descending" do
    it "orders the pages in descending order of visit count" do
      expect(orderer.order_descending).to eq(
        [["/path_b", 23], ["/path_c", 16], ["/path_a", 5]]
      )
    end

    it "raises an error if the pages and visit counts aren't provided as a hash" do
      orderer = described_class.new("a page")
      expect { orderer.order_descending }.to raise_error(
        RuntimeError, "Pages and visit counts must be provided as a hash"
      )
    end
  end
end
