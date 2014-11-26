class Text < ActiveRecord::Base
  # belongs_to :post
  has_one :post_content
  attr_accessible :text

  def build_html
    ActionController::Base.helpers.content_tag :p, text.to_s.gsub("\n", "</br>").html_safe
  end
end
