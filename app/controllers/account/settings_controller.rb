class Account::SettingsController < ApplicationController
  before_action :authenticate_user!

  def show
    @setting = current_user
  end

  def edit
    @setting = current_user
  end

  def update
    @setting = current_user
    if @setting.update(user_params)
      redirect_to account_setting_path, notice: "Update Success"
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :nickname, :hobbies, :birthday, :sex, :selfintroduction, :address, :avatar)
  end
end
