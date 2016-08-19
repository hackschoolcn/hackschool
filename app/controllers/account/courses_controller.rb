class Account::CoursesController < ApplicationController
  before_action :authenticate_user!
  
  def index

    if current_user.orders.last.paid?
      @courses = Course.all
      else
        flash[:warning] = "您还没购买任何课程"
    end

  end

end
