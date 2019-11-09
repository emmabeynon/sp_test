class LogValidator
  attr_reader :logfile

  def initialize(logfile)
    @logfile = logfile
  end

  def validate
    validated_lines = []
    File.read(logfile).each_line do |line|
      validated_lines << strip_path(line)
    end

    validated_lines
  end

private

  def strip_path(line)
    line.split(" ").first
  end
end
