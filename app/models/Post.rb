class Post < ActiveRecord::Base
  attr_accessible :title, :preview, :tags, :post_contents_attributes
  has_many :post_contents
  accepts_nested_attributes_for :post_contents, allow_destroy: true

  # has_many :text
  # has_many :pictures, :as => :parent
  # has_many :videos, :as => :parent

  before_save :build_html

  def self.blog_posts
    self.where(:project_id => nil)
  end

  def self.project_posts
    self.where("project_id IS NOT NULL")
  end

  def build_html
    html = ""
    # (self.text_entries + self.pictures + self.videos).sort_by { |c| c.post_order }.each do |content|
    self.post_contents.each do |content|
      html += content.build_html
    end

    self.content_html = html
  end
end

class PostContent < ActiveRecord::Base
  attr_accessible :post_order, :content, :content_type
  belongs_to :post
  belongs_to :content, :polymorphic => true
  accepts_nested_attributes_for :content

  def build_html
    content.build_html
  end
end