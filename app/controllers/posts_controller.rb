class PostsController < ApplicationController
  
  def index
    @posts = Post.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html
    end
  end

  def update
    post = Post.find(params[:id])

    respond_to do |format|
      if post and post.update_attributes(params[:post])
        format.html { redirect_to post }
      else
        format.html { redirect_to posts_url }
      end
    end
  end

  def create
    # Go through content looking for [PICTURE(URL)] and change to html
    post = Post.new(params[:post])

    respond_to do |format|
      if post.save
        format.html { redirect_to post }
      else
        format.html { render 'new' }
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end
end
