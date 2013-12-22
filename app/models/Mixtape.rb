class Mixtape < ActiveRecord::Base
  attr_accessible :title, :player_html, :content, :tags, :explicit
end