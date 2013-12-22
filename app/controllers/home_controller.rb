class HomeController < ApplicationController
  def index
    @posts = Post.select("id, title, preview").order("id desc").limit(3)
    @updates = Update.select("id, title, preview").order("id desc").limit(3)
  end
end
