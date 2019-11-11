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
    it "returns a list of paths and IP addresses" do
      log_validator = described_class.new(valid_logfile)
      paths = [
        %w(/help_page/1 126.318.035.038),
        %w(/contact 184.123.665.067),
        %w(/home 184.123.665.067),
        %w(/about/2 444.701.448.104),
        %w(/help_page/1 929.398.951.889),
        %w(/help_page/1 722.247.931.582),
        %w(/help_page/1 646.865.545.408),
        %w(/home 235.313.352.950),
        %w(/contact 184.123.665.067),
        %w(/help_page/1 543.910.244.929),
        %w(/home 316.433.849.805),
      ]

      expect(log_validator.validate).to eq(paths)
    end

    it "does not return a malformed path" do
      log_validator = described_class.new(invalid_logfile)
      expect(log_validator.validate)
        .not_to include(%w(not_a_path 184.123.665.067))
    end

    it "does not return a path with an invalid IP address" do
      log_validator = described_class.new(invalid_logfile)
      expect(log_validator.validate)
        .not_to include(%w(/invalid_ip 184.123.665.067.not-ip))
    end
  end
end
