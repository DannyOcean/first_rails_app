class TasksController < ApplicationController
  before_action :signed_in_user
  before_action :find_task, except: [:create, :new]

  def create
    @task = current_project.tasks.build(task_params)
    if @task.save
      flash.now[:success] = "Task created"
      redirect_to user_project_path(current_user, current_project)
    else
      flash.now[:error] = "Project name should be from 3 to 50 characters"
      render "tasks/new"
    end
  end

  def new
    @task = current_project.tasks.build
  end

  def update
    @task.update_attributes(params[:task])
    if @task.errors.blank?
      flash[:success] = "Successfully updated!"
      redirect_to user_project_path(current_user, current_project)
    else
      flash.now[:error] = "Name should be greater than 2 characters and less than 50 characters length"
      render "edit"
    end
  end

  def edit
  end

  def destroy
    @task.destroy
    flash[:success] = "Task deleted"
    redirect_to user_projects_path
  end

  private

  def current_project
    @project = current_user.projects.where(id: params[:project_id]).first
  end

  def find_task
    @task = current_project.tasks.where(id: params[:id]).first
  end

  def task_params
    params.require(:task).permit(:name, :status)
  end
end
