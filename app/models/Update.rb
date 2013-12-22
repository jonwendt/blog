class Update < ActiveRecord::Base
  attr_accessible :title, :preview, :content, :tags

  before_save :convert_to_html

  def convert_to_html
    # Replace [PICTURE] tags with html
    content.scan(/\[PICTURE\((.+)\)\]/).each do |url|
      url = url.first
      html = Picture.find(url).build_html
      content.gsub!(/\[PICTURE\(#{url}\)\]/, html)
    end

    # Replace newlines with br tags
    content.gsub!("\n", "<br>")
  end
end