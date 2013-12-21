class Video < ActiveRecord::Base
  attr_accessible :path, :caption

  def build_html
    caption_html = ActionController::Base.helpers.content_tag :p, "\n#{self.caption}"
    ActionController::Base.helpers.content_tag :div, ActionController::Base.helpers.content_tag(:img, caption_html, :src => self.path),
                                                     { :class => "image-container" }
  end
end