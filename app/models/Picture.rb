class Picture < ActiveRecord::Base
  attr_accessible :path, :caption, :width, :height
  belongs_to :parent, :polymorphic => true

  def build_html
    caption_html = ActionController::Base.helpers.content_tag :p, "#{self.caption}", :class => "image-caption"
    ActionController::Base.helpers.content_tag :div, ActionController::Base.helpers.content_tag(:img, caption_html, :src => self.path, :class => "expandable"),
                                                     { :class => "image-container", :style => "width: #{(400.0/self.height.to_f * self.width.to_f).to_i}px" }
  end
end