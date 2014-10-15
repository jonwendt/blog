class MixtapesController < ApplicationController
  def index
    @mixtapes = Mixtape.all
  end

  def show
    @mixtape = Mixtape.find(params[:id])
  end

  def new
    @mixtape = Mixtape.find(params[:id])
  end

  def edit
    @mixtape = Mixtape.find(params[:id])
  end

  def create
    mixtape = Mixtape.new(params[:mixtape])

    respond_to do |format|
      if mixtape.save
        format.html { redirect_to mixtape }
      else
        format.html { render 'new' }
      end
    end
  end

  def update
    mixtape = Mixtape.find(params[:id])

    respond_to do |format|
      if mixtape and mixtape.update_attributes(params[:mixtape])
        format.html { redirect_to mixtape }
      else
        format.html { redirect_to mixtapes_url }
      end
    end
  end
end
