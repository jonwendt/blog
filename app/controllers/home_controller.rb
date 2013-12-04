class HomeController < ApplicationController
  def index
    @posts = Post.find(:all, :order => "id desc", :select => "id, title, preview", :limit => 6)
  end
end
