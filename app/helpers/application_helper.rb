module ApplicationHelper
  def nav_link(title, url, options = {})
    linked_controller = Rails.application.routes.recognize_path(url)[:controller]
    link_class = (params[:controller] == linked_controller) ? "active" : ""

    content_tag(:li, link_to(title, url), :class => link_class)
  end
end