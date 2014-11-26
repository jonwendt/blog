require 'mechanize'
require 'fastimage'

class Picture < ActiveRecord::Base
  attr_accessible :path, :caption, :width, :height

  def build_html
    caption_html = ActionController::Base.helpers.content_tag :p, self.caption.html_safe, :class => "image-caption"
    ActionController::Base.helpers.content_tag :div, ActionController::Base.helpers.content_tag(:img, caption_html, :src => self.path, :class => "expandable img-responsive"),
                                                     { :class => "image-container", :style => "width: #{(400.0/self.height.to_f * self.width.to_f).to_i}px" }
  end

  def self.add_from_urls(urls)
    mech = Mechanize.new

    urls.each do |url|
      imgur_page = mech.get url
      image_link = imgur_page.images.first.url.to_s
      dimensions = FastImage.size(image_link)
      caption = imgur_page.search('#description').text
      caption = nil if caption.blank?
      Picture.create(path: image_link, width: dimensions.first, height: dimensions.second, caption: caption)
    end
  end
end