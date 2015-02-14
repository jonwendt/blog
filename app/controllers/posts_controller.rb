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

    @project = Project.find(params[:project_id]) if params[:project_id]

    respond_to do |format|
      format.html
    end
  end

  def new
    @post = Post.new
    @project = Project.find(params[:project_id]) if params[:project_id]
    @title = @project ? @project.title : "Jon's Thoughts On..."

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

  def update
    post = Post.find(params[:id])

    respond_to do |format|
      if post and post.update_attributes(params[:post])#.permit(:project_id, :title, :tags, :_destroy, post_contents_attributes: [:text, :id, content_attributes: []]))
        format.html { redirect_to (post.project_id ? project_post_path(post.project_id, post.id) : post) }
      else
        format.html { redirect_to posts_path }
      end
    end
  end

  def create
    post = Post.new(params[:post])#.permit(:project_id, :title, :tags, post_contents_attributes: [:text, :id]))

    respond_to do |format|
      if post.save
        format.html { redirect_to (post.project_id ? project_post_path(post.project_id, post.id) : post) }
      else
        format.html { render 'new' }
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path }
    end
  end

  def update_position
    params[:post][:post_contents_attributes].each_with_index do |id, index|
      PostContent.update_all({ position: index+1 }, { id: id })
    end
  end
end
