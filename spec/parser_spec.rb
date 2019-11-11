require "spec_helper"
require "parser"

RSpec.describe Parser do
  let(:valid_logfile) { File.open("spec/fixtures/valid_logfile.log") }

  describe "#initialize" do
    it "accepts a logfile as an argument" do
      parser = described_class.new(valid_logfile)
      expect(parser.logfile).to eq(valid_logfile)
    end
  end
end
