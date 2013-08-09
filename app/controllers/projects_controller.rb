class ProjectsController < ApplicationController

  before_action :signed_in_user
  #before_filter :find_project, only: [:show, :update, :edit, :destroy]
  before_action :find_project, except: [:index, :new, :create]

  def index
    @projects = current_user.projects
  end

  def show
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
    #@project = @user.projects.create(project_params)

    #@project = User.find(params[:user_id]).projects.create(name: params[:name])
    ##@project = Project.create(name: params[:name])
    #@projects = Project.all
  end

  def update
    @project.update_attributes(project_params)
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
    render "index"

    #@deleted = Project.find(params[:id]).destroy
    #@project = Project.includes(:tasks).first
    #render :show
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
