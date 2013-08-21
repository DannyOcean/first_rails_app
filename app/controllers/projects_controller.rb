class ProjectsController < ApplicationController

  before_action :signed_in_user
  before_action :find_project, except: [:index, :new, :create]

  def index
    @user = current_user
    @projects = current_user.projects
  end

  def show
    @task = current_user.projects.where(id: params[:id]).first.tasks.build
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
      render "projects/new"
    end
  end

  def update
    @project.update_attributes(params[:project])
    if @project.errors.blank?
      redirect_to action: "index"
    else
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
