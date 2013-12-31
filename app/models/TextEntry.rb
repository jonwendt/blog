class TextEntry < ActiveRecord::Base
  attr_accessible :text, :post_order

  def build_html
    ActionController::Base.helpers.content_tag :p, text.html_safe
  end
end