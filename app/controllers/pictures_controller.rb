class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_filter :enforce_privileges, :only => [:new, :create, :edit, :update, :destroy, :add_from_urls]

  def index
    @pictures = Picture.all
  end

  def add_from_urls
    Picture.add_from_urls(params[:urls].split(' '))

    respond_to do |format|
      format.html { redirect_to pictures_path }
    end
  end

  private
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
