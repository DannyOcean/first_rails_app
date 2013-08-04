class TasksController < ApplicationController
  def create
    render text: "task created"
    #@task = Project.find(params[:project_id]).tasks.create(name: params[:name])
  end

  def destroy
    render text: "text destroyed"
    #@task = Task.find(params[:id])
    #@task.destroy
  end
end
