class Post < ActiveRecord::Base
  attr_accessible :title, :preview, :content, :tags

  before_save :convert_to_html

  def convert_to_html
    # Replace [PICTURE] tags with html
    content.scan(/\[PICTURE\((.+)\)\]/).each do |url|
      content.gsub!(/\[PICTURE\(#{url.first}\)\]/, ActionController::Base.helpers.image_tag("posts/#{url.first}"))
    end

    # Replace newlines with br tags
    content.gsub!("\n", "<br/>")
  end
end