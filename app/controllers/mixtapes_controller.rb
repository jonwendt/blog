class MixtapesController < ApplicationController
  def index
    @mixtapes = Mixtape.all
  end

  def show
    @mixtape = Mixtape.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end
end
