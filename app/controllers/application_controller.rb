class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end

  def check_subscription_expiration
    if !current_user.member_expire_date || current_user.member_expire_date < Time.now
      flash[:warning] = "您还未付费订阅课程"
      redirect_to :back
    end
  end

end
