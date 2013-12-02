module ApplicationHelper
  def nav_link(title, url)
    # options = {}
    # link = ""
    # link_class = nil
    # li_class = name.gsub(/\s/, '_').downcase
    # li_class = li_class + " sidebar-link"

    # if active or pages && active_page?(pages)
    #   link_class = "selected"
    #   li_class = li_class + " active"
    # end

    # if not url.empty?
    #   link = link_to(name, url, {:class => link_class}.merge(link_options))
    # end

    # options[:class] = li_class

    link_class = (params[:controller] == url) ? "active" : ""

    puts params[:controller]
    puts url
    puts link_class

    content_tag :li, link_to(title, url_for(:controller => url, :action => "index")), :class => link_class
  end
end
