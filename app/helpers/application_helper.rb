module ApplicationHelper
  def nav_link(title, url)
    linked_controller = Rails.application.routes.recognize_path(url)[:controller]
    link_class = (params[:controller] == linked_controller) ? "active" : ""

    content_tag :li, link_to(title, url_for(:controller => linked_controller, :action => "index")), :class => link_class
  end
end
