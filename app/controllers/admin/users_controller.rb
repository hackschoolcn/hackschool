class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "资料已更新！"
    else
      render :edit
    end
  end

  # def turn_to_admin
  #   @user = User.find(params[:id])
  #   @user.admin!

  #   redirect_to :back
  # end

  # def turn_to_user
  #   @user = User.find(params[:id])
  #   @user.user!

  #   redirect_to :back
  # end

  def turn_to_admin
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save
    redirect_to :back
  end

  def turn_to_user
    @user = User.find(params[:id])
    @user.is_admin = false
    @user.save
    redirect_to :back
  end

  def user_params
    params.require(:user).permit(:username, :nickname, :hobbies, :birthday, :selfintroduction, :address, :gender, :avatar)
  end
end
