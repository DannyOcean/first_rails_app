class UsersController < ApplicationController

  before_filter :find_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  #before_filter :check_if_admin, only: [:destroy]

  def index
    @users = User.all
  end

  def create
    #render text: params.inspect
    @user = User.create(user_params)
    if @user.errors.blank?
      sign_in @user
      flash[:success] = "Yo man! Glad to see you!"
      redirect_to @user
    else
      flash.now[:error] = "You made some mistake in the form, try again :)"
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
      flash[:success] = "Profile successfully updated!"
      sign_in @user
      redirect_to action: "index"
    else
      flash.now[:error] = "You made some mistake in the form, try again :)"
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

  def find_user
    @user = User.where(id: params[:id]).first
    render_404 unless @user
  end

  def user_params
    params.require(:user).permit(:login, :name, :email, :password, :password_confirmation)
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
