class PostsController < ApplicationController

  def index
    @posts = Post.blog_posts.select("title, preview, id, tags").order("id desc")

    respond_to do |format|
      format.html
    end
  end

  def show
    @posts = Post.blog_posts.select("title, preview, id, tags").order("id desc")
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

  def edit
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # TODO - Ugly
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

  # TODO - Ugly
  def create
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

  def update_position
    params[:post][:post_contents_attributes].each_with_index do |id, index|
      PostContent.update_all({ position: index+1 }, { id: id })
    end
  end
end
