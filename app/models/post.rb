class Post < ActiveRecord::Base
  attr_accessible :title, :preview, :tags, :post_contents_attributes, :project_id
  has_many :post_contents
  accepts_nested_attributes_for :post_contents, allow_destroy: true, reject_if: :all_blank

  before_save :build_html

  def self.blog_posts
    self.where(:project_id => nil)
  end

  def self.project_posts
    self.where("project_id IS NOT NULL")
  end

  def build_html
    html = ""
    self.post_contents.each do |content|
      html += content.build_html
    end

    self.preview = self.post_contents.first.content_type == 'Text' ? self.post_contents.first.content.text : self.post_contents.first.content.build_html
    self.content_html = html
  end
end

class PostContent < ActiveRecord::Base
  attr_accessible :position, :content, :content_type, :content_id, :content_attributes
  belongs_to :post
  belongs_to :content, :polymorphic => true
  accepts_nested_attributes_for :content, allow_destroy: true
  default_scope { order(:position) }

  def build_html
    content.build_html
  end

  def build_content(params, assignment_options)
    params[:content_type] = 'Text' if params[:text] # TODO - Fix
    puts params.inspect
    self.content = params[:content_type].constantize.new(params.except(:content_type))
  end
end
