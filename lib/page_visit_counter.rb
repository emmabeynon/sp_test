class PageVisitCounter
  attr_reader :paths

  def initialize(paths)
    @paths = paths
  end

  def count_visits
    raise "Paths must be provided as an array" unless paths.is_a?(Array)

    paths.each_with_object({}) do |path, hash|
      hash.has_key?(path) ? hash[path] += 1 : hash[path] = 1
    end
  end
end
