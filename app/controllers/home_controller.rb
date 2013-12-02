class HomeController < ApplicationController
  def index
    @posts = Post.find(:all, :order => "id desc", :limit => 6).reverse
  end
end
