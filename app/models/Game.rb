class Game < ActiveRecord::Base
  attr_accessible :title, :preview

  has_many :posts
  has_many :videos
  has_many :pictures
end