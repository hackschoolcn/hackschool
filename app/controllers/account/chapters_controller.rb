class Account::ChaptersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_subscription_expiration

  def index
    @course = Course.find(params[:course_id])

    if @course.is_hidden?
      flash[:warning] = "此课程没有开课"
      redirect_to root_path
    end

    if current_user.enrolled_courses.include?(@course)
      @chapters = @course.chapters.where(is_hidden: false)
    else
      flash[:warning] = "请先报名参加该课程"
      redirect_to course_path(@course)
    end
  end
end
