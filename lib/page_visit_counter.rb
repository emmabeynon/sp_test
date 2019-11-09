class PageVisitCounter
  attr_reader :paths

  def initialize(paths)
    @paths = paths
  end

  def count_visits
    paths.each_with_object({}) do |path, hash|
      hash.has_key?(path) ? hash[path] += 1 : hash[path] = 1
    end
  end
end
