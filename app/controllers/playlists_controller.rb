class PlaylistsController < ApplicationController
  before_filter :enforce_privileges, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.find(params[:id])
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def create
    playlist = Playlist.new(params[:playlist])

    respond_to do |format|
      if playlist.save
        format.html { redirect_to playlist }
      else
        format.html { render 'new' }
      end
    end
  end

  def update
    playlist = Playlist.find(params[:id])

    respond_to do |format|
      if playlist and playlist.update_attributes(params[:playlist])
        format.html { redirect_to playlist }
      else
        format.html { redirect_to playlists_path }
      end
    end
  end
end
