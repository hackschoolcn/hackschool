class Account::CoursesController < ApplicationController
  before_action :authenticate_user!
  
  def index

    if current_user.member_expire_date
      @courses = Course.all
      else
        flash[:warning] = "您还没购买任何课程"
    end

  end

end
