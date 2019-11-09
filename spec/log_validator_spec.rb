require "spec_helper"
require "log_validator"

RSpec.describe LogValidator do
  let(:valid_logfile) { File.open("spec/fixtures/valid_logfile.log") }
  let(:invalid_logfile) { File.open("spec/fixtures/invalid_logfile.log") }

  describe "#initialize" do
    it "accepts a logfile" do
      log_validator = described_class.new(valid_logfile)
      expect(log_validator.logfile).to eq(valid_logfile)
    end
  end

  describe "#validate" do
    it "returns a list of stripped paths" do
      log_validator = described_class.new(valid_logfile)
      paths = %w(/help_page/1 /contact /home /about/2 /help_page/1 /help_page/1 /help_page/1 /home /contact /help_page/1 /home)
      expect(log_validator.validate).to eq(paths)
    end

    it "does not return a malformed path" do
      log_validator = described_class.new(invalid_logfile)
      expect(log_validator.validate).not_to include("not_a_path")
    end
  end
end
