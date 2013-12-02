module PostsHelper
  def sidebar_link(post)
    link_class = (params[:id] == post.id.to_s) ? "active" : ""

    content_tag :li, link_to(post.title, url_for(:controller => :posts, :action => "show", :id => post.id)), :class => link_class
  end

  def memories_posts(posts)
    posts.select { |p| p.tags.split(", ").include? "memories" }
  end

  def musings_posts(posts)
    posts.select { |p| p.tags.split(", ").include? "musings" }
  end
end
