module ApplicationHelper
  # returns the full title on a per-page basis
  def full_title page_title
    title = "Callcenter"
    title << " | #{page_title}" unless page_title.empty?
    title
  end

  def gateway_outbound_routes_path *args
    gateway_outbound_route_path *args
  end
end
