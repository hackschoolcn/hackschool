class Account::SettingsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to account_setting_path, notice: "Update Success"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :nickname, :hobbies, :birthday, :selfintroduction, :address, :gender)
  end
end
