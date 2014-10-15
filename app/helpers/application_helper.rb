module ApplicationHelper
  def nav_link(title, url, options = {})
    linked_controller = Rails.application.routes.recognize_path(url)[:controller]
    link_class = (params[:controller] == linked_controller) ? "active" : ""
    # TODO - clean up
    link_class = '' if params[:controller] == 'posts' and params[:project_id] and not linked_controller == 'projects'
    link_class = 'active' if params[:controller] == 'posts' and params[:project_id] and linked_controller == 'projects'

    content_tag(:li, link_to(title, url), :class => link_class)
  end
end