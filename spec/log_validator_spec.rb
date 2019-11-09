require "spec_helper"
require "log_validator"

RSpec.describe LogValidator do
  let(:valid_logfile) { File.open("spec/fixtures/valid_logfile.log") }

  describe "#initialize" do
    it "accepts a logfile" do
      log_validator = described_class.new(valid_logfile)
      expect(log_validator.logfile).to eq(valid_logfile)
    end
  end
end
