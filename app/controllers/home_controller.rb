class HomeController < ApplicationController
  def index
    @blog_posts = Post.blog_posts.select("id, title, preview").order("id desc").limit(3)
    @project_posts = Post.project_posts.select("id, title, preview").order("id desc").limit(3)
  end
end
