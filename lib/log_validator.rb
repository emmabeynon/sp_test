class LogValidator
  attr_reader :logfile

  def initialize(logfile)
    @logfile = logfile
  end

  def validate
    validated_lines = []
    File.read(logfile).each_line do |line|
      validated_lines << split_line(line) if valid_log?(line)
    end

    validated_lines
  end

private

  def split_line(line)
    line.split(" ")
  end

  def valid_path?(path)
    /^\//.match?(path)
  end

  def valid_ip?(ip_address)
    !/[^\d.]/.match?(ip_address)
  end

  def valid_log?(line)
    data_items = split_line(line)
    valid_path?(data_items.first) && valid_ip?(data_items.last)
  end
end
