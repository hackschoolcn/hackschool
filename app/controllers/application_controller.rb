class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    unless current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end

  def check_subscription_expiration
    if !current_user.member_expire_date || current_user.member_expire_date < Time.now

      flash[:notice] = "请先选择你的套餐"
      redirect_to plans_path

    end
  end
end
