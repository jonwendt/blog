class Picture < ActiveRecord::Base
  attr_accessible :path, :caption, :width, :height

  def build_html
    caption_html = ActionController::Base.helpers.content_tag :p, self.caption.html_safe, :class => "image-caption"
    ActionController::Base.helpers.content_tag :div, ActionController::Base.helpers.content_tag(:img, caption_html, :src => self.path, :class => "expandable img-responsive"),
                                                     { :class => "image-container", :style => "width: #{(400.0/self.height.to_f * self.width.to_f).to_i}px" }
  end
end