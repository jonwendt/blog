class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :is_admin_user?
  before_filter :enforce_privileges, :except => [:index, :show]

  def is_admin_user?
    @is_admin = (current_user == User.find_by_email("jpwendt@asu.edu"))
  end

  def enforce_privileges
    if @is_admin == false
      puts params.inspect
      redirect_to url_for(:controller => params[:controller])
    end
  end
end
