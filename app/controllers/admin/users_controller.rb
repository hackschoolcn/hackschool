class Admin::UsersController < AdminController
  before_action :find_user, only: %i(show edit update turn_to_admin turn_to_user)

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
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
    @user.is_admin = true
    @user.save
    redirect_to :back
  end

  def turn_to_user
    @user.is_admin = false
    @user.save
    redirect_to :back
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :nickname, :hobbies, :birthday, :selfintroduction, :address, :gender, :avatar)
  end
end
