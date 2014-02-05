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
    post_contents_attr = params[:post].delete(:post_contents_attributes)

    post = Post.create(params[:post].select { |k,v| k == "title" or k == "tags"})

    post_contents_attr.each do |pca|
      content = pca.second[:content]
      next if content[:_destroy] == "true"
      # Create PostContent
      pc = post.post_contents.new(post_order: pca.first)

      # Create the content for PostContent to contain
      content_type = content[:content_type].capitalize
      if content_type == "Picture" || content_type == "Video"
        content = eval(content_type).find(content[:id])
      elsif content_type == "Text"
        content = Text.create(text: content[:text])
      # else 
      # content = eval(content_type).new(content.except(:content_type, :_destroy))
      end

      pc.content = content
      pc.save
      puts pc.inspect
    end

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
