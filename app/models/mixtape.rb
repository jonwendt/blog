class Mixtape < ActiveRecord::Base
  attr_accessible :title, :player_html, :content, :download_link, :tags, :explicit
end
