class Game < ActiveRecord::Base
  attr_accessible :title, :preview, :download_link

  has_many :updates
  has_many :videos
  has_many :pictures
end