class VisitCountOrderer
  attr_reader :page_visits

  def initialize(page_visits)
    @page_visits = page_visits
  end

  def order_descending
    page_visits.sort_by { |page, visit_count| visit_count }.reverse
  end
end
