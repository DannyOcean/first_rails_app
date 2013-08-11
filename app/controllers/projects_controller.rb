class ProjectsController < ApplicationController

  before_action :signed_in_user
  before_action :find_project, except: [:index, :new, :create]
  #before_filter :find_project, only: [:show, :update, :edit, :destroy]

  def index
    @user = current_user
    @projects = current_user.projects
  end

  def show
    @user = current_user
    if @project
      @project = Project.includes(:tasks).find(params[:id])
    else
      render_404
    end
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created"
      redirect_to user_projects_path
    else
      flash.now[:error] = "Project name should be from 3 to 50 characters"
      render "projects/new"
    end
  end

  def update
    @project.update_attributes(params[:project])
    if @project.errors.blank?
      flash[:success] = "Successfully updated!"
      redirect_to action: "index"
    else
      flash.now[:error] = "Name should not exceed 50 characters"
      render "edit"
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "Project deleted"
    redirect_to user_projects_path
  end

  def edit
  end

  def new
    @project = current_user.projects.build
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def find_project
    @project = current_user.projects.where(id: params[:id]).first
    render_404 unless @project
  end

end
