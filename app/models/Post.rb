class Post < ActiveRecord::Base
  attr_accessible :title, :preview, :content, :tags

  before_save :convert_to_html

  def convert_to_html
    # Replace [PICTURE] tags with html
    content.scan(/\[PICTURE\((.+)\)\]/).each do |url|
      url = url.first
      pic = Picture.find(url)
      html = build_picture_html(pic)
      # puts "=============== #{html} ==============="
      content.gsub!(/\[PICTURE\(#{url}\)\]/, html)
    end

    # Replace newlines with br tags
    content.gsub!("\n", "<br>")
  end

  def build_picture_html(pic)
    caption_html = ActionController::Base.helpers.content_tag :p, "\n#{pic.caption}"
    ActionController::Base.helpers.content_tag :div, ActionController::Base.helpers.content_tag(:img, caption_html, :src => pic.path),
                                                     { :class => "image-container" }
  end
end