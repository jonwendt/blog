class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :is_admin_user?

  def is_admin_user?
    @is_admin = (current_user == User.find_by_email("jpwendt@asu.edu"))
  end
end
