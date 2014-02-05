class Project < ActiveRecord::Base
  attr_accessible :title, :preview, :download_link

  has_many :posts, dependent: :destroy
  has_many :videos, :as => :parent
  has_many :pictures, :as => :parent
end