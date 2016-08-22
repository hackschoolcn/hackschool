class Account::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_expiration, only: [:enroll_course, :drop_course]

  def index
    @courses = current_user.enrolled_courses
  end

  def enroll_course
    @course = Course.find(params[:id])

    if !current_user.is_member_of?(@course)
      current_user.enroll_course!(@course)
      flash[:notice] = "报名成功"
    else
      flash[:warning] = "您已报名该课程"
    end

    redirect_to account_courses_path
  end

  def drop_course
    @course = Course.find(params[:id])

    if current_user.is_member_of?(@course)
      current_user.drop_course!(@course)
      flash[:notice] = "退课成功"
    else
      flash[:warning] = "您还未报名该课程"
    end

    redirect_to account_courses_path
  end

end
