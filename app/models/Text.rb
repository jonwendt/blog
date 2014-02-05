class Text < ActiveRecord::Base
  attr_accessible :text

  def build_html
    ActionController::Base.helpers.content_tag :p, text.html_safe
  end
end