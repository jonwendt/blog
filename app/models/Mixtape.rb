class Mixtape < ActiveRecord::Base
  attr_accessible :title, :preview, :content, :tags, :explicit
end