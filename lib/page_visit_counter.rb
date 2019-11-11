class PageVisitCounter
  attr_reader :paths

  def initialize(paths)
    @paths = paths
  end

  def count_visits
    check_for_array

    paths.each_with_object({}) do |path_data, hash|
      path = path_data.first
      hash.has_key?(path) ? hash[path] += 1 : hash[path] = 1
    end
  end

  def count_unique_visits
    check_for_array

    unique_visits = paths.each_with_object({}) do |path_data, hash|
      path = path_data.first
      ip = path_data.last
      hash.has_key?(path) ? hash[path] << ip : hash[path] = [ip]
    end

    unique_visits.transform_values { |value| value.uniq.count }
  end

private

  def check_for_array
    raise "Paths must be provided as an array" unless paths.is_a?(Array)
  end
end
