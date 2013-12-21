class HomeController < ApplicationController
  def index
    @posts = Post.select("id, title, preview").order("id desc").limit(6)
  end
end
