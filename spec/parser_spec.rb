require "spec_helper"
require "parser"

RSpec.describe Parser do
  let(:valid_logfile) { File.open("spec/fixtures/valid_logfile.log") }
  let(:parser) { described_class.new(valid_logfile) }

  describe "#initialize" do
    it "accepts a logfile as an argument" do
      expect(parser.logfile).to eq(valid_logfile)
    end
  end

  describe "#ordered_page_visits" do
    it "returns a list of page paths ordered by visits in descending order" do
      page_visits = [["/help_page/1", 5], ["/home", 3], ["/contact", 2], ["/about/2", 1]]
      output = ""
      page_visits.each { |item| output += "#{item[0]} #{item[1]} page visits\n" }

      expect { parser.ordered_page_visits }.to output(output).to_stdout
    end

    context "unique keyword argument provided" do
      it "returns a list of page paths ordered by unique visits in descending order" do
        page_visits = [["/help_page/1", 4], ["/home", 2], ["/about/2", 1], ["/contact", 1]]
        output = ""
        page_visits.each { |item| output += "#{item[0]} #{item[1]} page visits\n" }

        expect { parser.ordered_page_visits(unique: true) }.to output(output)
                                                           .to_stdout
      end
    end
  end
end
