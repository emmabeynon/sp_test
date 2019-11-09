class VisitCountOrderer
  attr_reader :page_visits

  def initialize(page_visits)
    @page_visits = page_visits
  end

  def order_descending
    unless page_visits.is_a?(Hash)
      raise "Pages and visit counts must be provided as a hash"
    end

    page_visits.sort_by { |page, visit_count| visit_count }.reverse
  end
end
