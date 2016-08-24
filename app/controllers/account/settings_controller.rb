class Account::SettingsController < AccountController
  before_action :authenticate_user!

  def index
    @user = current_user
    drop_breadcrumb "用户设置"
  end

  def edit_profile
    @user = current_user
    drop_breadcrumb "编辑个人档案"
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(user_params)
      redirect_to account_settings_path, notice: "Update Success"
    else
      render :edit_profile
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :nickname, :hobbies, :birthday, :selfintroduction, :address, :gender, :avatar)
  end
end
