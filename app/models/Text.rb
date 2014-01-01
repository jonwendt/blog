class Text < ActiveRecord::Base
  attr_accessible :text
  belongs_to :parent, :polymorphic => true

  def build_html
    ActionController::Base.helpers.content_tag :p, text.html_safe
  end
end