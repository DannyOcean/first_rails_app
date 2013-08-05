class UsersController < ApplicationController

  before_filter :find_user, only: [:show, :edit, :update, :destroy]
  #before_filter :check_if_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def create
    #render text: params.inspect
    @user = User.create(params[:user])
    if @user.errors.blank?
      redirect_to user_path(@user)
    else
      #render text: "#{@user.errors.full_messages}"
      render "new"
      end
  end

  def show
    unless @user
      render text: "Page not found"
    end
  end

  def update
    @user.update_attributes(params[:user])
    if @user.errors.blank?
      redirect_to action: "index"
    else
      #render text: "#{@user.errors.full_messages}"
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to action: "index"
  end

  def new
    @user = User.new
  end

  def edit
  end

  private

  def find_user
    @user = User.where(id: params[:id]).first
    render_404 unless @user
  end
end
