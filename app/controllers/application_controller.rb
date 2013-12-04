class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :puts_params
  before_filter :is_admin_user?

  def puts_params
    puts "====== PARAMS: #{params.inspect} ======"
  end

  def is_admin_user?
    @is_admin = (current_user == User.find_by_email("jpwendt@asu.edu"))
  end
end
