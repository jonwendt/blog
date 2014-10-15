class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def videos
    @project = Project.find(params[:id])
  end

  # TODO - use permitted params
  def update
    project = Project.find(params[:id])

    respond_to do |format|
      if project and project.update_attributes(params[:project])
        format.html { redirect_to project }
      else
        format.html { redirect_to projects_url }
      end
    end
  end

  def create
    project = Project.new(params[:project])

    respond_to do |format|
      if project.save
        format.html { redirect_to project }
      else
        format.html { render 'new' }
      end
    end
  end
end
