class ProjectsController < ApplicationController
  def index
    render text: "some projects"
    @projects = Project.all
  end

  def show
    render text: "showed"
    #@project = Project.includes(:tasks).find(params[:id])
  end

  def create
    render text: "project created"

    #@project = User.find(params[:user_id]).projects.create(name: params[:name])
    ##@project = Project.create(name: params[:name])
    #@projects = Project.all
  end

  def destroy
    render text: "project destroyed"

    #@deleted = Project.find(params[:id]).destroy
    #@project = Project.includes(:tasks).first
    #render :show
  end
end
