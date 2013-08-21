class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, only: [:index,:destroy]
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def create
    @user = User.create(user_params)
    if @user.errors.blank?
      sign_in @user
      flash[:success] = "Yo man! Glad to see you!"
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    render_404 unless @user
  end


  def update
    @user.update_attributes(params[:user])
    if @user.errors.blank?
      flash[:success] = "Profile successfully updated!"
      sign_in @user
      redirect_to action: "index"
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User has been slain! mhahahahah >:D"
    redirect_to action: "index"
  end

  def new
    @user = User.new
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:login, :name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.where(id: params[:id]).first
    render_404 unless @user
  end

  def correct_user
    @user = User.where(id: params[:id]).first
    redirect_to(root_url) unless current_user?(@user)
  end

  def check_if_admin
    render_403 unless current_user.admin?
  end

end
