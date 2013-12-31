class Post < ActiveRecord::Base
  attr_accessible :title, :preview, :content, :tags

  has_many :text_entries
  has_many :pictures, :as => :parent
  has_many :videos, :as => :parent

  scope :blog_posts, where(:project_id => nil)
  scope :project_posts, where("project_id IS NOT NULL")

  before_save :build_html

  def build_html
    html = ""
    (self.text_entries + self.pictures + self.videos).sort_by { |c| c.post_order }.each do |content|
      html += content.build_html
    end

    self.content = html
  end
end