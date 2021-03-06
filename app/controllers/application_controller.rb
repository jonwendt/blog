class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :is_admin_user?
  # before_filter :enforce_privileges, :only => [:new, :create, :edit, :update, :destroy]

  def is_admin_user?
    if user_signed_in? == false
      @is_admin = false
    else
      @is_admin = (current_user.email == "jpwendt@asu.edu")
    end
  end

  def enforce_privileges
    if @is_admin == false
      redirect_to url_for(:controller => params[:controller]), :alert => 'Please sign in.'
    end
  end
end
