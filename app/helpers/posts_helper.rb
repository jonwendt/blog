module PostsHelper
  def sidebar_link(post)
    link_class = (params[:id] == post.id.to_s) ? "list-group-item active" : ""
    path = post.has_attribute?(:project_id) ? project_post_path(post.project_id, post.id) : post_path(post)
    link_to(post.title, path, :class => link_class)
  end

  def memories_posts(posts)
    posts.select { |p| p.tags.split(", ").include? "memories" }
  end

  def musings_posts(posts)
    posts.select { |p| p.tags.split(", ").include? "musings" }
  end

  def sidebar_partial(project)
    return project ? 'projects/sidebar' : 'sidebar'
  end

  def header_text(project)
    return project ? title_with_link(project) : "Jon's Thoughts On..."
  end
end
